import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:MusicFindApp/MusicRepository.dart';

class SongIdentifier with ChangeNotifier {
  AudDAPIRepository apiRepo = new AudDAPIRepository();
  final List<dynamic> _songsList = [

  ];
  List<dynamic> get getSongsList => _songsList;

  dynamic _selectedSong = null;
  dynamic get getSelectedSong => _selectedSong;

  bool _animacion = false;
  bool get getAnimacion => _animacion;

  bool _found = false;
  bool get getFound => _found;

  Record _audio = Record();

  void notFound(){
    _found = false;
    notifyListeners();
  }

  void changeAnimacion() {
    _animacion = !_animacion;
    notifyListeners();
  }

  void setSelectedSong(dynamic song) {
    _selectedSong = song;
    notifyListeners();
  }

  void noSelectedSong() {
    _selectedSong = null;
    notifyListeners();
  }

  void addSong(dynamic song) {
    if (!_songsList.contains(song)) _songsList.add(song);
    notifyListeners();
  }

  void removeSong(dynamic song) {
    if (_songsList.contains(song)) _songsList.remove(song);
    notifyListeners();
  }

  Future<dynamic> recording() async {
    Directory? dir = await getTemporaryDirectory();
    if (await _audio.hasPermission()) {
      await _audio.start(
        path: '${dir.path}/maybeASong.m4a',
      );
    }

    bool isRecording = await _audio.isRecording();
    if (isRecording) {
      Timer(Duration(seconds: 6), () async {
        String? filePath = await _audio.stop();
        File audioFile = File(filePath!);
        Uint8List audioBytes = audioFile.readAsBytesSync();
        String audioBinary = base64Encode(audioBytes);
        var response = await apiRepo.postToAudd(audioBinary);
        if (response.statusCode == 200) {
          setSelectedSong(jsonDecode(response.body)["result"]);
          print(_selectedSong);
          _found = true;
          notifyListeners();
        } else {
          notifyListeners();
          return null;
        }
      });
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class Finder with ChangeNotifier {
bool isRecording = false;

  Future<void> record() async {
    final record = Record();
    if (await record.hasPermission()) {
      await record.start(
        path: 'aFullPath/myFile.m4a',
        encoder: AudioEncoder.aacLc,
        bitRate: 128000,
        samplingRate: 44100,
      );
    }

    bool isRecording = await record.isRecording();

    await record.stop();
  }
}

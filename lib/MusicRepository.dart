import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class AudDAPIRepository {
  Future<dynamic> postToAudd(audioBinary){
    return post(Uri.parse("https://api.audd.io/"), body: {
          'api_token': dotenv.env["API_TOKEN"],
          'return': 'spotify,apple_music',
          'audio': audioBinary,
        });
  }
}
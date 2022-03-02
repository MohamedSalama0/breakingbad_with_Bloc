import 'package:breakingbad_with_bloc/constants/api_constants.dart';
import 'package:breakingbad_with_bloc/data/models/quote.dart';
import 'package:dio/dio.dart';

class CharactersApi {
  Dio? dio;

  CharactersApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    );
  dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters () async
  {
    try {
      Response response = await dio!.get('characters');
      print(response.data.toString());
      return response.data;
    } on Exception catch (e) {
      print(e.toString());
      return [];
    }
  }
  Future<List<dynamic>> getCharactersQuote(String charName) async
  {
    try {
      Response response = await dio!.get('quote/random',queryParameters: {'author': charName});
      print(response.data.toString());
      return response.data;
    } on Exception catch (e)
    {
      print(e.toString());
      return [];
    }
  }

}

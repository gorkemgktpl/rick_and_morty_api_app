
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/character.dart';

part 'character_client.g.dart';

@RestApi(baseUrl: "/character")
abstract class CharacterClient {
  factory CharacterClient(Dio dio) = _CharacterClient;

  @GET("/{characterId}")
  Future<Character> getCharacter({@Path('characterId') required String characterId});

  @GET("/{characterId}")
  Future<List<Character>> getCharacterList({@Path('characterId') required List<String> characterList});

}
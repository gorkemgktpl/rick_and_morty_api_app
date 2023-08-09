import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/episode.dart';

part 'episode_client.g.dart';


abstract class EpisodeClient {
  factory EpisodeClient(Dio dio) = _EpisodeClient;

  @GET("/episode/{episodeId}")
  Future<Episode> getEpisode({@Path('episodeId') required String episodeId});

}
import 'package:json_annotation/json_annotation.dart';
part 'episode.g.dart';

@JsonSerializable()
class Episode {
  int? id;
  String? name;
  String? airDate;
  String? episode;
  List<String>? characters;
  String? url;
  DateTime? created;

  Episode({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters,
    this.url,
    this.created,
  });

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}

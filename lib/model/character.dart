import 'package:json_annotation/json_annotation.dart';

import 'location.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
    int? id;
    String? name;
    String? status;
    String? species;
    String? type;
    String? gender;
    Location? origin;
    Location? location;
    String? image;
    List<String>? episode;
    String? url;
    DateTime? created;

    Character({
        this.id,
        this.name,
        this.status,
        this.species,
        this.type,
        this.gender,
        this.origin,
        this.location,
        this.image,
        this.episode,
        this.url,
        this.created,
    });

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);

}


import 'dart:convert';

/// ---------- Root ----------
class CharactersModel {
  final Info info;
  final List<Character> results;

  CharactersModel({
    required this.info,
    required this.results,
  });

  factory CharactersModel.fromJson(Map<String, dynamic> json) {
    return CharactersModel(
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

 class Info {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  Info({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      count: json['count'] as int,
      pages: json['pages'] as int,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );
  }
}

 class Character {
  final int id;
  final String name;
  final CharacterStatus status;
  final String species;
  final String type;
  final CharacterGender gender;
  final NameUrl origin;
  final NameUrl location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] as int,
      name: json['name'] as String,
      status: CharacterStatusX.fromJson(json['status'] as String),
      species: json['species'] as String,
      type: json['type'] as String? ?? '',
      gender: CharacterGenderX.fromJson(json['gender'] as String),
      origin: NameUrl.fromJson(json['origin'] as Map<String, dynamic>),
      location: NameUrl.fromJson(json['location'] as Map<String, dynamic>),
      image: json['image'] as String,
      episode: (json['episode'] as List<dynamic>).cast<String>(),
      url: json['url'] as String,
      created: DateTime.parse(json['created'] as String),
    );
  }
}

 class NameUrl {
  final String name;
  final String url;

  NameUrl({required this.name, required this.url});

  factory NameUrl.fromJson(Map<String, dynamic> json) {
    return NameUrl(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
}




enum CharacterStatus { alive, dead, unknown }

extension CharacterStatusX on CharacterStatus {
  static CharacterStatus fromJson(String v) {
    switch (v.toLowerCase()) {
      case 'alive':
        return CharacterStatus.alive;
      case 'dead':
        return CharacterStatus.dead;
      default:
        return CharacterStatus.unknown;
    }
  }
}

enum CharacterGender { female, male, genderless, unknown }

extension CharacterGenderX on CharacterGender {
  static CharacterGender fromJson(String v) {
    switch (v.toLowerCase()) {
      case 'female':
        return CharacterGender.female;
      case 'male':
        return CharacterGender.male;
      case 'genderless':
        return CharacterGender.genderless;
      default:
        return CharacterGender.unknown;
    }
  }
}




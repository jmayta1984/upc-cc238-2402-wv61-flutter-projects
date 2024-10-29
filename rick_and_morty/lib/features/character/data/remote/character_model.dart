class CharacterModel {
  final int id;
  final String name;
  final String image;
  final String status;
  final String species;
  final String gender;

  CharacterModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.status,
      required this.species,
      required this.gender});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        image: json['image'] ?? '',
        status: json['status'] ?? '',
        species: json['species'] ?? '',
        gender: json['gender'] ?? '');
  }
}


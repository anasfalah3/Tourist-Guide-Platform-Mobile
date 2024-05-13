
class Location {
  final int? id;
  final String? name;
  final String? city;
  final String? description;
  final String? img;

  Location({this.id, this.name, this.city, this.description, this.img});

  factory Location.fromJson(dynamic json) {
    return Location(
        id: json['id'] as int,
        name: json['name'] as String,
        city: json['city'] as String,
        description: json['description'] as String,
        img: json['img'] as String
        );
  }

  static List<Location> locationsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Location.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Location {id: $id, name: $name, city: $city, description: $description, img: $img}';
  }
}
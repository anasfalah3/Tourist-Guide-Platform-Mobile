
class Experience {
  final int? id;
  final String? title;
  final String? description;
  final String? city;
  final String? price;
  final String? img;

  Experience({this.id, this.title, this.description, this.city, this.price, this.img});

  factory Experience.fromJson(dynamic json) {
    return Experience(
        id: json['id'] as int,
        title: json['title'] as String,
        description: json['description'] as String,
        city: json['city'] as String,
        price: json['price'] as String,
        img: json['img'] as String
        );
  }

  static List<Experience> experiencesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Experience.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Experience {id: $id, title: $title, description: $description,city: $city, price: $price, img:$img}';
  }
}
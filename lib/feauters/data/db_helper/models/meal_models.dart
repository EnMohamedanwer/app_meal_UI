class Meal {
  final String name;
  final String imageUrl;
  final String description;
  final String time;
  final double rate;
  final int? id;

  Meal(
      {required this.name,
      required this.imageUrl,
      required this.description,
      required this.time,
      this.id,
      required this.rate});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'time': time,
      'rate': rate,
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'],
      name: map['name'],
      imageUrl: map['imageUrl'],
      description: map['description'],
      time: map['time'],
      rate: map['rate'],
    );
  }
}
class Meal {
  final String name;
  final String image;
  final String description;
  final String time;
  final double rate;
  final double price;
  // final int? id;

  Meal(
      {required this.name,
      required this.image,
      required this.description,
      required this.time,
      required this.price,
      // this.id,
      required this.rate
       });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'time': time,
      'price': price,
      'rate': rate,
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      // id: map['id'],
      name: map['name'],
      image: map['image'],
      price: map['price'],
      description: map['description'],
      time: map['time'],
      rate: map['rate'],
    );
  }
}
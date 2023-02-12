class Hotel {
  late String name;
  late double rate;
  late String image;
  late double price;
  late String location;

  Hotel({required this.name, required this.rate, required this.image});
  Hotel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rate = double.parse(json['rate'].toString());
    image = json['image'];
    price = double.parse(json['price'].toString());
    location = json['location'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['rate'] = rate;
    data['image'] = image;
    data['price'] = price;
    data['location'] = location;
    return data;
  }
}

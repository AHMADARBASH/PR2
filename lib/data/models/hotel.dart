class Hotel {
  late String name;
  late double rate;
  late String image;
  Hotel({required this.name, required this.rate, required this.image});
  Hotel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rate = double.parse(json['rate'].toString());
    image = json['image'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['rate'] = rate;
    data['image'] = image;
    return data;
  }
}

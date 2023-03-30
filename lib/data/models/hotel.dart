class Hotel {
  late int id;
  late String name;
  late String phone;
  late String website;
  late String country;
  late String city;
  late String street;
  late String description;
  late double reviews;

  Hotel({
    required this.id,
    required this.name,
    required this.phone,
    required this.website,
    required this.country,
    required this.city,
    required this.street,
    required this.description,
    required this.reviews,
  });
  Hotel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    website = json['website'];
    country = json['country'];
    city = json['city'];
    street = json['street'];
    description = json['description'];
    reviews = double.tryParse(json['reviews'].toString()) ?? 0;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['website'] = website;
    data['country'] = country;
    data['city'] = city;
    data['street'] = street;
    data['description'] = description;
    data['reviews'] = reviews;
    return data;
  }
}

import 'dart:convert';

import 'package:hotely/data/models/hotel.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
import '../../utilities/exceptions.dart';

class HotelsRepository {
  Future<List<Hotel>> getTop5Hotels() async {
    final url = Uri.parse(
        'https://hotely-8c4a4-default-rtdb.europe-west1.firebasedatabase.app/hotels/Top5.json');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw HTTPException(message: json.decode(response.body));
    }
    List<Hotel> final_data = [];
    List<dynamic> api_data = json.decode(response.body);
    api_data.forEach((element) {
      final_data.add(Hotel.fromJson(element));
    });
    return final_data;
  }

  // Future<List<Hotel>> searchForHotel() async {
  //   await Duration(seconds: 1);
  //   List<Hotel> _data = [Hotel()];
  //   return _data
  // }
}

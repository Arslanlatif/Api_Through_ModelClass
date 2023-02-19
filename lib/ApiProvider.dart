import 'dart:convert';

import 'package:get_put_api/ModelClass.dart';
import 'package:http/http.dart' as http;

abstract class APIProvider {
  var baseURL = 'https://jsonplaceholder.typicode.com/';
  String get apiURL;
  String get url => baseURL + apiURL;

  Future fatch() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed');
    }
  }
}

class APIPhotos extends APIProvider {
  Future<List<ModelClass>> fatchPhotos() async {
    var getPhotos = await fatch() as List;
    var photos = getPhotos.map((e) => ModelClass.fromMap(e)).toList();
    return photos;
  }

  @override
  String get apiURL => 'photos';
}

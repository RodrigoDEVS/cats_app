import 'dart:convert';

import 'package:gatos_app/data/models/breeds_model.dart';
import 'package:http/http.dart' as http;

class CatsApiSource {
  Future<List<BreedsModel>> getBreeds() async {
    final Uri url = Uri.parse(
      'https://api.thecatapi.com/v1/breeds?limit=10&page=0',
    );
    final http.Response response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "x-api-key":
            "live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr",
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> decoded = json.decode(response.body);
      return decoded.map((e) => BreedsModel.fromMap(e)).toList();
    } else {
      throw Exception('Failed to load cats');
    }
  }

  Future<List<BreedsModel>> getCatsByBreed(String breed) async {
    final Uri url = Uri.parse(
      'https://api.thecatapi.com/v1/breeds/search?q=$breed&attach_image=5',
    );
    final http.Response response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "x-api-key":
            "live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr",
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> decoded = json.decode(response.body);
      return decoded.map((e) => BreedsModel.fromMap(e)).toList();
    } else {
      throw Exception('Failed to load cats');
    }
  }
}

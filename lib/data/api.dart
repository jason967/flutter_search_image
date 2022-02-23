import 'dart:convert';

import '../model/photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  final baseUrl = 'https://pixabay.com/api/';
  final key = '25565499-7ab173a17174aaa3d9c824095';
  Future<List<Photo>> fetch(String query) async {
    final reponse = await http.get(
      Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo&pretty=true'),
    );
    Map<String, dynamic> jsonResponse = jsonDecode(reponse.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}

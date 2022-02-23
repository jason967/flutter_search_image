import 'dart:convert';

import 'package:image_search/data/photo_api_repository.dart';

import '../model/photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi implements PhotoApiRepository {
  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '25565499-7ab173a17174aaa3d9c824095';
  @override
  Future<List<Photo>> fetch(String query, {http.Client? client}) async {
    client ??= http.Client();

    final reponse = await client.get(
      Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'),
    );

    Map<String, dynamic> jsonResponse = jsonDecode(reponse.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}

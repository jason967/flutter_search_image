import 'dart:convert';

import 'package:http/http.dart' as http;

import 'result_origin.dart';

class PixabayApi {
  final http.Client client;
  PixabayApi(this.client);

  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '25565499-7ab173a17174aaa3d9c824095';

  Future<Result<Iterable>> fetch(String query) async {
    try {
      final response = await client
          .get(Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'));
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      Iterable hits = jsonResponse['hits'];
      return Result.success(hits);
    } catch (e) {
      return const Result.error('network error');
    }
  }
}

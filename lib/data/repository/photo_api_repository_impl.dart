import 'dart:convert';

import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';

import '../../domain/model/photo.dart';

class PhotoApiRepositoryImpl implements PhotoApiRepository {
  // final api = PixabayApi(http.Client());
  PixabayApi api;
  PhotoApiRepositoryImpl(this.api);
  @override
  Future<List<Photo>> fetch(String query) async {
    final result = await api.fetch(query);
    return result.map((e) => Photo.fromJson(e)).toList();
  }
}

import 'dart:async';

import 'package:image_search/data/photo_api_repository.dart';

import '../model/photo.dart';

class HomeViewModel {
  final PhotoApiRepository repository;
  HomeViewModel(this.repository);

  final _photoStreamContreller = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamContreller.stream;

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photoStreamContreller.add(result);
  }
}

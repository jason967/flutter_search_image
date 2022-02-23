import 'dart:async';

import 'package:image_search/data/api.dart';

import '../model/photo.dart';

class HomeViewModel {
  final PixabayApi api;
  final _photoStreamContreller = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamContreller.stream;
  HomeViewModel(this.api);

  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoStreamContreller.add(result);
  }
}

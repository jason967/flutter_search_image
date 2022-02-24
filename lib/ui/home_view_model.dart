import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_search/data/photo_api_repository.dart';

import '../model/photo.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  List<Photo> _photos = [];
  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  // final _photoStreamContreller = StreamController<List<Photo>>()..add([]);
  // Stream<List<Photo>> get photoStream => _photoStreamContreller.stream;
  HomeViewModel(this.repository);

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photos = result;
    notifyListeners();
    // _photoStreamContreller.add(result);
  }
}

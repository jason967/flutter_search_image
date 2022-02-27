import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/presentation/home/home_ui_event.dart';

import '../../data/data_source/result_origin.dart';
import '../../domain/model/photo.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  List<Photo> _photos = [];
  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  //이런식으로 만들게 되면 누구든 수정할 수 있게 됌 <- 이러면 안 됌
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  // final _photoStreamContreller = StreamController<List<Photo>>()..add([]);
  // Stream<List<Photo>> get photoStream => _photoStreamContreller.stream;
  HomeViewModel(this.repository);

  Future<void> fetch(String query) async {
    final Result<List<Photo>> result = await repository.fetch(query);
    _isLoading = true;
    notifyListeners();
    result.when(
      success: (photos) {
        _photos = photos;
        notifyListeners();
      },
      error: (message) {
        _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );
    _isLoading = false;
    notifyListeners();
  }
}

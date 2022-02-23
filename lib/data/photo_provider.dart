import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search/data/api.dart';

import '../model/photo.dart';

class PhotoProvider extends InheritedWidget {
  final PixabayApi api;

  final _photoStreamContreller = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamContreller.stream;
  PhotoProvider({
    Key? key,
    required Widget child,
    required this.api,
  }) : super(key: key, child: child);

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'context 내에 존재하지 않음');
    return result!;
  }

  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoStreamContreller.add(result);
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return oldWidget.api != api;
  }
}

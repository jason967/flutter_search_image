import 'package:flutter/material.dart';
import 'package:image_search/data/api.dart';

class PhotoProvider extends InheritedWidget {
  final PixabayApi api;
  const PhotoProvider({
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

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return oldWidget.api != api;
  }
}

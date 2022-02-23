import 'package:flutter/material.dart';

import '../../model/photo.dart';

class PhotoWidget extends StatelessWidget {
  final Photo photo;
  const PhotoWidget({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(photo.previewUrl),
        ),
      ),
    );
  }
}

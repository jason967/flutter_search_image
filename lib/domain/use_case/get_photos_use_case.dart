import 'dart:math';

import '../../data/data_source/result_origin.dart';
import '../model/photo.dart';
import '../repository/photo_api_repository.dart';

class GetPhotosUseCase {
  final PhotoApiRepository repository;

  GetPhotosUseCase(this.repository);

  Future<Result<List<Photo>>> call(String query) async {
    final result = await repository.fetch(query);
    return result.when(
      success: (photos) {
        return Result.success(photos.sublist(0, min(3, photos.length)));
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}

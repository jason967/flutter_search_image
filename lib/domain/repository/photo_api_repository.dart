import 'package:image_search/data/data_source/result_origin.dart';

import '../model/photo.dart';

abstract class PhotoApiRepository {
  Future<Result<List<Photo>>> fetch(String query);
}

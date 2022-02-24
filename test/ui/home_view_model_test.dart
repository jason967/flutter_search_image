import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo.dart';
import 'package:image_search/ui/home_view_model.dart';

void main() {
  test('stream이 잘 동작해야 한다', () async {
    final viewModel = HomeViewModel(FakePhotoApiRepository());
    await viewModel.fetch('apple');

    final result = fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(viewModel.photos, result);
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<List<Photo>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));
    return fakeJson.map((e) => Photo.fromJson(e)).toList();
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 1834639,
    "pageURL":
        "https://pixabay.com/photos/apple-red-fruit-food-fresh-ripe-1834639/",
    "type": "photo",
    "tags": "apple, red, fruit",
    "previewURL":
        "https://cdn.pixabay.com/photo/2016/11/18/13/47/apple-1834639_150.jpg",
    "previewWidth": 150,
    "previewHeight": 150,
    "webformatURL":
        "https://pixabay.com/get/gbf1c6a50e3da9d3350329b1a6f21587019c20d840ee23723c39d4493f41e52c5f592782c514eb8fd80b9f7e4c3f9438dd6cde27938113a66645d6b121471382d_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 640,
    "largeImageURL":
        "https://pixabay.com/get/g2825efd49ae5a5b9cfcff8b1f4114e3219ec246f4f1deb4ae16fd93d671b6b53362c7e5fcf3a581925f97db765a1c59ef9b273dc708aba7fe03112c193c342cd_1280.jpg",
    "imageWidth": 2827,
    "imageHeight": 2827,
    "imageSize": 1022194,
    "views": 62740,
    "downloads": 36911,
    "collections": 2180,
    "likes": 155,
    "comments": 38,
    "user_id": 2286921,
    "user": "Pexels",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
  },
  {
    "id": 1122537,
    "pageURL":
        "https://pixabay.com/photos/apple-water-droplets-fruit-moist-1122537/",
    "type": "photo",
    "tags": "apple, water droplets, fruit",
    "previewURL":
        "https://cdn.pixabay.com/photo/2016/01/05/13/58/apple-1122537_150.jpg",
    "previewWidth": 150,
    "previewHeight": 95,
    "webformatURL":
        "https://pixabay.com/get/g6fa26807a092913eb2bbf271ca0442fd7ca81f7f6199d8552b9295901461ff2321dc1ba4c94c749f51d4c31ff319d90c46c9131d79fbb19d13b426c4991fabb4_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 409,
    "largeImageURL":
        "https://pixabay.com/get/gd92eaefa4a673db391cabf671d58f3e3dd13cb404a1dbda79d74e0e86622fb492eb5bd6d5a132fbf77c82a4ba6a2070208d22d984920bcf23e8fc0968551816a_1280.jpg",
    "imageWidth": 4752,
    "imageHeight": 3044,
    "imageSize": 5213632,
    "views": 244075,
    "downloads": 137977,
    "collections": 3530,
    "likes": 1024,
    "comments": 159,
    "user_id": 1445608,
    "user": "mploscar",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/01/05/14-08-20-943_250x250.jpg"
  }
];

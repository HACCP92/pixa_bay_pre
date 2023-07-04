import 'package:pixa_bay_pre/data/api/pixabay_api.dart';
import 'package:pixa_bay_pre/data/mapper/photo_mapper.dart';
import 'package:pixa_bay_pre/data/model/photo.dart';
import 'package:pixa_bay_pre/data/repository/photo_repository.dart';

class PixabayPhotoRepositoryImpl implements PhotoRepository {
  final _api = PixabayApi();
  @override
  Future<List<Photo>> getPhotos(String query) async {
    final resultDto = await _api.getImages(query);

    if (resultDto.hits == null) {
      print(resultDto.hits);
      return [];
    }
    return resultDto.hits!.map((e) => e.toPhoto()).toList();
  }
}

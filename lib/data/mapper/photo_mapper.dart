import 'package:pixa_bay_pre/data/dto/pixabay_result_dto.dart';
import 'package:pixa_bay_pre/domain/model/photo.dart';

extension ToPhoto on Hits {
  Photo toPhoto() {
    return Photo(
      id: id ?? 0,
      url: webformatURL ?? '',
      tags: tags ?? '',
      views: views ?? 0,
    );
  }
}

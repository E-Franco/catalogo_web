import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../errors/errors.dart';

abstract class ImageRepository {
  Future<Either<UploadImageError, String>> upload(Uint8List bytes);
  Future<Either<DeleteImageError, void>> delete(String url);
}

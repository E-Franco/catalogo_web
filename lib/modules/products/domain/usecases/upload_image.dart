import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../errors/errors.dart';

abstract class UploadImage {
  Future<Either<UploadImageError, String>> call(Uint8List bytes);
}

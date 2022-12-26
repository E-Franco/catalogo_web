import 'package:catalogo_web/modules/products/domain/errors/errors.dart';
import 'package:catalogo_web/modules/products/domain/repositories/repositories.dart';
import 'package:catalogo_web/modules/products/domain/usecases/usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class UploadImageImpl implements UploadImage {
  UploadImageImpl({required this.repository});

  ImageRepository repository;

  @override
  Future<Either<UploadImageError, String>> call(Uint8List bytes) {
    return repository.upload(bytes);
  }
}

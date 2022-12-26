import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import '../../domain/errors/errors.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';

class ImageRepositoryImpl implements ImageRepository {
  ImageRepositoryImpl({required this.datasource});

  final ImageDatasource datasource;

  @override
  Future<Either<DeleteImageError, void>> delete(String url) async {
    try {
      await datasource.delete(url);
      return const Right(null);
    } catch (_) {
      return Left(DeleteImageError());
    }
  }

  @override
  Future<Either<UploadImageError, String>> upload(Uint8List bytes) async {
    try {
      final result = await datasource.upload(bytes);
      return Right(result);
    } catch (_) {
      return Left(UploadImageError());
    }
  }
}

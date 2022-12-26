import 'package:dartz/dartz.dart';

import '../errors/errors.dart';

abstract class DeleteImage{
  Future<Either<DeleteImageError, void>> call(String url);
}
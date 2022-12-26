import 'package:dartz/dartz.dart';

import '../../domain/errors/errors.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/usecases.dart';

class DeleteImageImpl implements DeleteImage {
  DeleteImageImpl({required this.repository});

  final ImageRepository repository;

  @override
  Future<Either<DeleteImageError, void>> call(String url) {
    return repository.delete(url);
  }
}

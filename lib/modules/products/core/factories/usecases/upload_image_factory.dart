import '../../../domain/usecases/usecases.dart';
import '../../../infra/usecases/usecases.dart';
import '../repositories/repositories.dart';

UploadImage makeUploadImage() => UploadImageImpl(repository: makeImageRepository());
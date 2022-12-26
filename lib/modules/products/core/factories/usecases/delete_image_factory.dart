import '../../../domain/usecases/usecases.dart';
import '../../../infra/usecases/usecases.dart';
import '../factories.dart';

DeleteImage makeDeleteImage() => DeleteImageImpl(repository: makeImageRepository());
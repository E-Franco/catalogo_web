import '../../../domain/repositories/repositories.dart';
import '../../../infra/repositories/repositories.dart';
import '../datasources/datasources.dart';

ImageRepository makeImageRepository() => ImageRepositoryImpl(datasource: makeImageDatasource());
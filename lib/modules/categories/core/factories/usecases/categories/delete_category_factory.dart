import '../../../../domain/usecases/usecases.dart';
import '../../../../infra/usecases/usecases.dart';
import '../../repositories/categories_repository_factory.dart';

DeleteCategory makeDeleteCategory() => DeleteCategoryImpl(makeCategoriesRepository());
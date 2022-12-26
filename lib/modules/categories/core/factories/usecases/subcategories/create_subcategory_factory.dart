import '../../../../domain/usecases/usecases.dart';
import '../../../../infra/usecases/usecases.dart';
import '../../repositories/repositories.dart';

CreateSubCategory makeCreateSubCategory() => CreateSubCategoryImpl(makeSubCategoriesRepository());

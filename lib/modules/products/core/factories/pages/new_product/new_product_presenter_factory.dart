import 'package:catalogo_web/modules/categories/core/factories/factories.dart';

import '../../../../presentation/value_notifier.dart';
import '../../../../ui/pages/new_product/new_product.dart';
import '../../factories.dart';

NewProductPresenter makeNewProductPresenter() => ValueNotifierNewProductPresenter(
  createProduct: makeCreateProduct(),
  uploadImage: makeUploadImage(),
  getSubcategories: makeGetSubCategories(),
);
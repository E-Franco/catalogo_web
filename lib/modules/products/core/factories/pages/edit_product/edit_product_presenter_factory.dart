import 'package:catalogo_web/modules/categories/core/factories/factories.dart';

import '../../../../presentation/value_notifier.dart';
import '../../../../ui/pages/edit_product/edit_product.dart';
import '../../factories.dart';
import '../../usecases/usecases.dart';

EditProductPresenter makeEditProductPresenter() => ValueNotifierEditProductPresenter(
      updateProduct: makeUpdateProduct(),
      deleteImage: makeDeleteImage(),
      deleteProduct: makeDeleteProduct(),
      uploadImage: makeUploadImage(),
      getSubcategories: makeGetSubCategories(),
    );

import '../../../../domain/entities/entities.dart';
import '../../../../ui/pages/edit_product/edit_product.dart';
import 'edit_product.dart';

EditProductPage makeEditProductPage(ProductEntity product) => EditProductPage(
      presenter: makeEditProductPresenter(),
      product: product,
    );

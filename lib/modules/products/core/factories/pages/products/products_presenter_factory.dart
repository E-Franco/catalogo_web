import '../../../../presentation/value_notifier.dart';
import '../../../../ui/pages/products/products.dart';
import '../../usecases/usecases.dart';

ProductsPresenter makeProductsPresenter() => ValueNotifierProductsPresenter(
      getProducts: makeGetProducts(),
    );

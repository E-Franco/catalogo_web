import '../../../../../../service_locator.dart';
import '../../../../ui/pages/products/products.dart';

ProductsPage makeProductsPage() => ProductsPage(
      presenter: serviceLocator.get<ProductsPresenter>(),
    );

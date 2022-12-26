import '../models/product_model.dart';

abstract class ProductDatasource {
  Future<List<ProductModel>> all();
  Future<ProductModel> create(ProductModel model);
  Future<void> delete(String id);
  Future<ProductModel> update(ProductModel model);
}

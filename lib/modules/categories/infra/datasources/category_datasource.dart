import '../models/models.dart';

abstract class CategoryDatasource{
  Future<List<CategoryModel>> all();
  Future<CategoryModel> create(name);
  Future<void> delete(String id);
  Future<CategoryModel> update(String id, String name);
}
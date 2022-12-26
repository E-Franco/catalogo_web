import '../models/models.dart';

abstract class SubCategoryDatasource{
  Future<List<SubCategoryModel>> all(String categoryId);
  Future<SubCategoryModel> create(String name, String categoryId);
  Future<void> delete(String id, String categoryId);
  Future<SubCategoryModel> update(String id, String name, String categoryId);
}
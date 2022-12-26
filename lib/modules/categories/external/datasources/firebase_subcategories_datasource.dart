import 'package:cloud_firestore/cloud_firestore.dart';

import '../../infra/datasources/subcategory_datasource.dart';
import '../../infra/models/models.dart';

class FirebaseSubCategoriesDatasource implements SubCategoryDatasource {
  final FirebaseFirestore firestore;
  final String _categoriesCollection = 'categories';
  final String _collection = 'subcategories';
  FirebaseSubCategoriesDatasource(this.firestore);

  @override
  Future<List<SubCategoryModel>> all(String categoryId) async {
    final query = await firestore.collection(_categoriesCollection).doc(categoryId).collection(_collection).orderBy('name').get();
    final docs = query.docs;
    final categories = docs.map((doc) => SubCategoryModel.fromFirestore(doc)).toList();
    return categories;
  }

  @override
  Future<SubCategoryModel> create(String name, String categoryId) async {
    final docRef = await firestore.collection(_categoriesCollection).doc(categoryId).collection(_collection).add(
      {'name': name},
    );

    final doc = await docRef.get();
    return SubCategoryModel.fromFirestore(doc);
  }

  @override
  Future<void> delete(String id, String categoryId) async {
    final docRef = firestore.collection(_categoriesCollection).doc(categoryId).collection(_collection).doc(id);
    await docRef.delete();
  }

  @override
  Future<SubCategoryModel> update(String id, String name, String categoryId) async {
    final docRef = firestore.collection(_categoriesCollection).doc(categoryId).collection(_collection).doc(id);
    await docRef.update({'name': name});
    return SubCategoryModel(id: id, name: name);
  }
}

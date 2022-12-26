import 'package:cloud_firestore/cloud_firestore.dart';

import '../../infra/datasources/category_datasource.dart';
import '../../infra/models/models.dart';

class FirebaseCategoriesDatasource implements CategoryDatasource {
  final FirebaseFirestore firestore;
  final String _collection = 'categories';
  FirebaseCategoriesDatasource(this.firestore);

  @override
  Future<List<CategoryModel>> all() async {
    final query = await firestore.collection(_collection).orderBy('name').get();
    final docs = query.docs;
    final categories = docs.map((doc) => CategoryModel.fromFirestore(doc)).toList();
    return categories;
  }

  @override
  Future<CategoryModel> create(name) async {
    final docRef = await firestore.collection(_collection).add({'name': name});
    final doc = await docRef.get();
    return CategoryModel.fromFirestore(doc);
  }

  @override
  Future<void> delete(String id) async {
    final docRef = firestore.collection(_collection).doc(id);
    final batch = firestore.batch();

    final query = await docRef.collection('subcategories').get();
    for (DocumentSnapshot doc in query.docs) {
      batch.delete(doc.reference);
    }

    docRef.delete();

    await batch.commit();
  }

  @override
  Future<CategoryModel> update(String id, String name) async {
    final docRef = firestore.collection(_collection).doc(id);
    await docRef.update({'name': name});
    return CategoryModel(id: id, name: name);
  }
}

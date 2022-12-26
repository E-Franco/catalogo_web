import 'package:cloud_firestore/cloud_firestore.dart';

import '../../infra/datasources/datasources.dart';
import '../../infra/models/models.dart';

class FirebaseProductsDatasource implements ProductDatasource {
  FirebaseProductsDatasource(this.firestore);

  final FirebaseFirestore firestore;
  final String _collection = 'products';

  @override
  Future<List<ProductModel>> all() async {
    final query = await firestore.collection(_collection).orderBy('name').get();
    final docs = query.docs;
    final products = docs.map((doc) => ProductModel.fromFirestore(doc)).toList();
    return products;
  }

  @override
  Future<ProductModel> create(ProductModel model) async {
    final docRef = await firestore.collection(_collection).add(model.toJson());
    final doc = await docRef.get();
    return ProductModel.fromFirestore(doc);
  }

  @override
  Future<void> delete(String id) async {
    final docRef = firestore.collection(_collection).doc(id);
    await docRef.delete();
  }

  @override
  Future<ProductModel> update(ProductModel model) async {
    final docRef = firestore.collection(_collection).doc(model.id);
    await docRef.update(model.toJson());

    final doc = await docRef.get();
    return ProductModel.fromFirestore(doc);
  }
}

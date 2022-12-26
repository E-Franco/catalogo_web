import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/entities.dart';

class SubCategoryModel extends SubCategoryEntity {
  const SubCategoryModel({required super.id, required super.name});

  factory SubCategoryModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return SubCategoryModel(
      id: doc.id,
      name: data['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}

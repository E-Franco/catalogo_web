import 'subcategory_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/entities.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.name,
    super.subcategories,
  });

  factory CategoryModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return CategoryModel(
      id: doc.id,
      name: data['name'],
      subcategories: const <SubCategoryModel>[],
    );
  }

  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      subcategories: const <SubCategoryModel>[],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }

  int get subCategoriesCount => 0;
}

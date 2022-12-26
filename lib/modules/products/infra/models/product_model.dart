import 'package:catalogo_web/modules/categories/domain/entities/category_entity.dart';
import 'package:catalogo_web/modules/products/domain/entities/entities.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.code,
    required super.category,
    required super.subcategory,
    required super.brand,
    required super.image,
  });

  factory ProductModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return ProductModel(
      id: doc.id,
      name: data['name'],
      code: data['code'],
      subcategory: data['subcategory'],
      category: CategoryEntity(
        id: data['category']['id'],
        name: data['category']['name'],
      ),
      brand: data['brand'],
      image: data['image'],
    );
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      name: entity.name,
      code: entity.code,
      category: entity.category,
      brand: entity.brand,
      subcategory: entity.subcategory,
      image: entity.image,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'code': code,
      'brand': brand,
      'category': {
        'name': category.name,
        'id': category.id,
      },
      'image': image,
      'subcategory': subcategory,
    };
  }
}

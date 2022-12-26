import 'package:catalogo_web/modules/categories/domain/entities/category_entity.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  const ProductEntity({
    required this.name,
    required this.code,
    required this.category,
    required this.brand,
    required this.subcategory,
    this.id,
    this.image,
  });

  final String name;
  final String code;
  final CategoryEntity category;
  final String subcategory;
  final String brand;
  final String? id;
  final String? image;

  @override
  List<Object?> get props => [name, code, category, brand, subcategory];
}

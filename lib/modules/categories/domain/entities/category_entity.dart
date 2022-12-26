import 'package:catalogo_web/modules/categories/domain/entities/subcategory_entity.dart';
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String name;
  final List<SubCategoryEntity> subcategories;

  const CategoryEntity({
    required this.id,
    required this.name,
    this.subcategories = const <SubCategoryEntity>[],
  });
  
  @override
  List<Object?> get props => [id, name];
}

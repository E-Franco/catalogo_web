import 'package:catalogo_web/modules/categories/domain/entities/category_entity.dart';
import 'package:catalogo_web/modules/categories/domain/entities/subcategory_entity.dart';
import 'package:catalogo_web/modules/categories/domain/usecases/subcategory/get_subcategories.dart';
import 'package:flutter/foundation.dart';

import '../../../common/ui/helpers/helpers.dart';
import '../domain/entities/entities.dart';
import '../domain/usecases/usecases.dart';
import '../ui/pages/new_product/new_product.dart';

class ValueNotifierNewProductPresenter implements NewProductPresenter {
  ValueNotifierNewProductPresenter({
    required this.createProduct,
    required this.uploadImage,
    required this.getSubcategories,
  });

  final CreateProduct createProduct;
  final UploadImage uploadImage;
  final GetSubCategories getSubcategories;

  @override
  String? brand;

  @override
  late ValueNotifier<CategoryEntity?> category;

  @override
  late ValueNotifier<SubCategoryEntity?> subcategory;

  @override
  late ValueNotifier<List<SubCategoryEntity>?> subcategories;

  @override
  String? code;

  @override
  late ValueNotifier<Uint8List?> image;

  @override
  String? name;

  @override
  late ValueNotifier<UIState> state;

  @override
  void changeBrand(String value) => brand = value;

  @override
  void changeCategory(CategoryEntity value) => category.value = value;

  @override
  void changeCode(String value) => code = value;

  @override
  void changeImage(Uint8List value) => image.value = value;

  @override
  void changeName(String value) => name = value;

  @override
  void dispose() {
    state.dispose();
    category.dispose();
    subcategory.dispose();
    subcategories.dispose();
    image.dispose();
  }

  @override
  void init() {
    state = ValueNotifier<UIState>(UIState.initial);
    category = ValueNotifier<CategoryEntity?>(null);
    subcategories = ValueNotifier<List<SubCategoryEntity>?>(null);
    subcategory = ValueNotifier<SubCategoryEntity?>(null);
    image = ValueNotifier<Uint8List?>(null);
  }

  @override
  Future<void> save() async {
    String? url;
    setState(UIState.loading);

    if (image.value != null) {
      final uploadResult = await uploadImage(image.value!);
      uploadResult.fold(
        (l) {
          setState(UIState.error);
          return;
        },
        (r) => url = r,
      );
    }

    ProductEntity entity = ProductEntity(
      name: name!,
      code: code!,
      category: category.value!,
      brand: brand!,
      image: url,
      subcategory: subcategory.value!.name,
    );

    final result = await createProduct(entity);
    result.fold(
      (l) {
        setState(UIState.error);
      },
      (r) {
        setState(UIState.success);
      },
    );
  }

  @override
  Future<void> fetchSubCategories() async {
    setState(UIState.loading);
    final result = await getSubcategories(category.value!.id);
    result.fold((l) {}, (r) {
      subcategories.value = r;
    });
  }

  void setState(UIState newState) {
    if (state.value != UIState.inactive) state.value = newState;
  }
}

import 'package:flutter/foundation.dart';

import '../../../common/ui/helpers/ui_state.dart';
import '../../categories/domain/entities/entities.dart';
import '../../categories/domain/usecases/usecases.dart';
import '../domain/entities/product_entity.dart';
import '../domain/usecases/usecases.dart';
import '../ui/pages/edit_product/edit_product_presenter.dart';

class ValueNotifierEditProductPresenter implements EditProductPresenter {
  ValueNotifierEditProductPresenter({
    required this.updateProduct,
    required this.uploadImage,
    required this.deleteProduct,
    required this.deleteImage,
    required this.getSubcategories,
  });

  final UpdateProduct updateProduct;
  final UploadImage uploadImage;
  final DeleteProduct deleteProduct;
  final DeleteImage deleteImage;
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
  late ProductEntity product;

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
  void changeProduct(ProductEntity value) {
    product = value;
    brand = value.brand;
    category.value = CategoryEntity(id: value.category.id, name: value.category.name);
    code = value.code;
    name = value.name;
  }

  @override
  void dispose() {
    state.dispose();
    category.dispose();
    image.dispose();
    subcategory.dispose();
    subcategories.dispose();
  }

  @override
  void init() {
    state = ValueNotifier<UIState>(UIState.initial);
    category = ValueNotifier<CategoryEntity?>(null);
    image = ValueNotifier<Uint8List?>(null);
    subcategories = ValueNotifier<List<SubCategoryEntity>?>(null);
    subcategory = ValueNotifier<SubCategoryEntity?>(null);
  }

  @override
  Future<void> save() async {
    String? url;
    setState(UIState.loading);

    if (image.value != null) {
      final uploadResult = await uploadImage(image.value!);
      if (product.image != null) {
        deleteImage(product.image!);
      }

      uploadResult.fold(
        (l) {
          setState(UIState.error);
          return;
        },
        (r) => url = r,
      );
    } else {
      url = product.image;
    }

    ProductEntity entity = ProductEntity(
      id: product.id,
      name: name!,
      code: code!,
      category: category.value!,
      brand: brand!,
      image: url,
      subcategory: subcategory.value!.name,
    );

    final result = await updateProduct(entity);
    result.fold(
      (l) {
        setState(UIState.error);
      },
      (r) {
        setState(UIState.success);
      },
    );
  }

  void setState(UIState newState) {
    if (state.value != UIState.inactive) state.value = newState;
  }

  @override
  Future<void> delete() async {
    setState(UIState.loading);
    final result = await deleteProduct(product.id!);
    result.fold((l) {
      setState(UIState.error);
    }, (r) {
      setState(UIState.success);
      deleteImage(product.image!);
    });
  }

  @override
  Future<void> fetchSubCategories() async {
    final result = await getSubcategories(category.value!.id);
    result.fold((l) {}, (r) {
      subcategories.value = r;
    });
  }
}

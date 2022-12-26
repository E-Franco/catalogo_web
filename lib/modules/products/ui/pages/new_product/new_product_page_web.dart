import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../common/common.dart';
import '../../../../../service_locator.dart';
import '../../../../categories/domain/entities/entities.dart';
import '../../../../categories/ui/pages/categories/categories.dart';
import '../../../core/factories/factories.dart';
import '../products/products.dart';
import 'new_product_presenter.dart';

class NewProductPageWeb extends StatefulWidget {
  const NewProductPageWeb({super.key, required this.presenter});
  final NewProductPresenter presenter;

  @override
  NewProductPageWebState createState() => NewProductPageWebState();
}

class NewProductPageWebState extends State<NewProductPageWeb> {
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey();
    widget.presenter.init();
    super.initState();
  }

  @override
  void dispose() {
    widget.presenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          const SidebarMenu(),
          Expanded(
            child: Container(
              alignment: FractionalOffset.center,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: heightPercent(4, context),
                          ),
                          child: SizedBox(
                            height: heightPercent(25, context),
                            child: ValueListenableBuilder(
                              valueListenable: widget.presenter.image,
                              builder: (context, value, child) {
                                if (value != null) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(horizontal: widthPercent(2, context)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox(width: 200, child: Image.memory(value, fit: BoxFit.contain)),
                                    ),
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 75,
                          width: 300,
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              side: const BorderSide(width: 1, color: Colors.grey),
                            ),
                            icon: Icon(Icons.camera, size: 30, color: Colors.grey[800]),
                            label: const Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Adicionar imagem',
                                  style: TextStyle(color: Colors.black54, fontSize: 20),
                                ),
                              ),
                            ),
                            onPressed: pickImage,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          width: 500,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  keyboardType: const TextInputType.numberWithOptions(),
                                  textInputAction: TextInputAction.next,
                                  validator: RequiredValidator(errorText: Labels.requiredField),
                                  style: const TextStyle(fontSize: 20),
                                  cursorColor: Colors.red[400],
                                  onChanged: widget.presenter.changeCode,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                    labelText: 'Código',
                                    hintText: 'ex: 123',
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  validator: RequiredValidator(errorText: Labels.requiredField),
                                  style: const TextStyle(fontSize: 20),
                                  textInputAction: TextInputAction.next,
                                  cursorColor: Colors.red[400],
                                  onChanged: widget.presenter.changeName,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                    labelText: 'Nome',
                                    hintText: 'ex: Produto 1',
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  validator: RequiredValidator(errorText: Labels.requiredField),
                                  style: const TextStyle(fontSize: 20),
                                  textInputAction: TextInputAction.done,
                                  cursorColor: Colors.red[400],
                                  onChanged: widget.presenter.changeBrand,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                    labelText: 'Marca',
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ValueListenableBuilder(
                                  valueListenable: widget.presenter.category,
                                  builder: (context, value, child) {
                                    return ValueListenableBuilder(
                                      valueListenable: serviceLocator.get<CategoriesPresenter>().categories,
                                      builder: (context, categories, child) {
                                        return DropdownButtonFormField<CategoryEntity?>(
                                          iconSize: 30,
                                          isExpanded: true,
                                          value: value,
                                          validator: (category) {
                                            if (category == null) return Labels.requiredField;
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                          ),
                                          hint: const Text('Categoria'),
                                          style: const TextStyle(fontSize: 20, color: Colors.black54),
                                          items: categories.map<DropdownMenuItem<CategoryEntity?>>(
                                            (CategoryEntity categoria) {
                                              return DropdownMenuItem(
                                                value: categoria,
                                                child: Text(
                                                  categoria.name.upperCaseWords(),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (value) {
                                            widget.presenter.category.value = value;
                                            widget.presenter.subcategories.value = null;
                                            widget.presenter.fetchSubCategories();
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(height: 10),
                                ValueListenableBuilder(
                                  valueListenable: widget.presenter.subcategories,
                                  builder: (context, value, child) {
                                    return ValueListenableBuilder(
                                      valueListenable: widget.presenter.subcategory,
                                      builder: (context, subcategory, child) {
                                        return DropdownButtonFormField<SubCategoryEntity?>(
                                          iconSize: 30,
                                          isExpanded: true,
                                          value: subcategory,
                                          validator: (value) {
                                            if (value == null) return Labels.requiredField;
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                          ),
                                          hint: const Text('Subcategoria'),
                                          style: const TextStyle(fontSize: 20, color: Colors.black54),
                                          items: value?.map<DropdownMenuItem<SubCategoryEntity?>>(
                                            (SubCategoryEntity subcategoria) {
                                              return DropdownMenuItem(
                                                value: subcategoria,
                                                child: Text(
                                                  subcategoria.name.upperCaseWords(),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (value) {
                                            widget.presenter.subcategory.value = value;
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: heightPercent(3, context)),
                                  height: 50,
                                  width: double.maxFinite,
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      backgroundColor: Colors.green,
                                    ),
                                    icon: const Icon(Icons.check, color: Colors.white),
                                    label: const Text('Salvar', style: TextStyle(fontSize: 20, color: Colors.white)),
                                    onPressed: save,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void pickImage() async {
    final picker = ImagePicker();

    final xFile = await picker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      Uint8List bytes = await xFile.readAsBytes();
      widget.presenter.changeImage(bytes);
    }
  }

  Future<void> save() async {
    if (widget.presenter.category.value == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black54,
        content: Container(
          height: 60,
          alignment: FractionalOffset.centerLeft,
          child: const Text('Selecione uma categoria', style: TextStyle(fontSize: 20)),
        ),
      ));

      return;
    }

    if (_formKey.currentState!.validate()) {
      showDialog(context: context, builder: (_) => const LoadingDialog(msg: 'Salvando'));
      await widget.presenter.save();

      if (widget.presenter.state.value == UIState.success) {
        serviceLocator.get<ProductsPresenter>().fetchProducts();
        await showDialog(context: context, builder: (_) => const SuccessDialog(msg: 'Salvo!'));
        Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(pageBuilder: (context, a, b) {
            return makeProductsPage();
          }),
          (_) => false,
        );
      } else {
        await showDialog(context: context, builder: (_) => const ErrorDialog());
      }
    }
  }
}

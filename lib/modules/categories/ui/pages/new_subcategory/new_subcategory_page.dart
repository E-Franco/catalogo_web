import 'package:catalogo_web/modules/categories/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../../../common/common.dart';
import 'new_subcategory.dart';

class NewSubCategoryPage extends StatefulWidget {
  final CategoryEntity category;

  const NewSubCategoryPage({
    super.key,
    required this.presenter,
    required this.category,
  });

  final NewSubCategoryPresenter presenter;

  @override
  NewSubCategoryPageState createState() => NewSubCategoryPageState();
}

class NewSubCategoryPageState extends State<NewSubCategoryPage> {
  late TextEditingController _nomeController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey();
    _nomeController = TextEditingController();
    widget.presenter.init();
    super.initState();
  }

  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = 750;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.03,
          ),
          width: maxWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Nova Subcategoria',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                autofocus: true,
                textCapitalization: TextCapitalization.characters,
                controller: _nomeController,
                cursorColor: Colors.redAccent,
                style: const TextStyle(fontSize: 20),
                validator: RequiredValidator(errorText: Labels.requiredField),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 20),
              LayoutBuilder(
                builder: (context, constraints) {
                  return SizedBox(
                    width: constraints.maxWidth / 3,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        backgroundColor: Colors.green,
                      ),
                      onPressed: save,
                      child: const Text(
                        'Salvar',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void save() async {
    showDialog(context: context, builder: (_) => const LoadingDialog(msg: 'Um momento'));

    String name = _nomeController.text.trim();
    widget.presenter.save(name, widget.category.id).whenComplete(() {
      Navigator.of(context).pop();
      if (widget.presenter.state.value == UIState.success) {
        showDialog(context: context, builder: (_) => const SuccessDialog(msg: 'Salvo!'))
            .whenComplete(() => Navigator.of(context).pop(true));
      } else {
        showDialog(context: context, builder: (_) => const ErrorDialog(msg: 'Falha ao salvar!'));
      }
    });
  }
}

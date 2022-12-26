import 'package:catalogo_web/common/ui/widgets/dialogs/confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../../../common/common.dart';
import '../../../domain/entities/category_entity.dart';
import 'edit_category.dart';

class EditCategoryPage extends StatefulWidget {
  const EditCategoryPage({
    super.key,
    required this.presenter,
    required this.category,
  });

  final EditCategoryPresenter presenter;
  final CategoryEntity category;

  @override
  EditCategoryPageState createState() => EditCategoryPageState();
}

class EditCategoryPageState extends State<EditCategoryPage> {
  late TextEditingController _nomeController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey();
    _nomeController = TextEditingController(text: widget.category.name);
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
                'Editar',
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
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
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
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          side: const BorderSide(width: 1, color: Colors.red),
                        ),
                        onPressed: delete,
                        child: const Text(
                          'Excluir',
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void save() async {
    showDialog(context: context, builder: (_) => const LoadingDialog(msg: 'Um momento'));

    String name = _nomeController.text.trim();
    CategoryEntity category = CategoryEntity(id: widget.category.id, name: name);

    widget.presenter.save(category).whenComplete(() {
      Navigator.of(context).pop();
      if (widget.presenter.state.value == UIState.success) {
        showDialog(context: context, builder: (_) => const SuccessDialog(msg: 'Salvo!'))
            .whenComplete(() => Navigator.of(context).pop(true));
      } else {
        showDialog(context: context, builder: (_) => const ErrorDialog(msg: 'Falha ao salvar!'));
      }
    });
  }

  void delete() {
    showDialog(
      context: context,
      builder: (_) => const ConfirmationDialog(message: Labels.deleteCategory),
    ).then((confirmation) {
      if (confirmation == true) {
        showDialog(context: context, builder: (_) => const LoadingDialog(msg: 'Um momento'));
        widget.presenter.delete(widget.category).whenComplete(() {
          Navigator.of(context).pop();
          if (widget.presenter.state.value == UIState.success) {
            showDialog(context: context, builder: (_) => const SuccessDialog(msg: 'Excluído!'))
                .whenComplete(() => Navigator.of(context).pop(true));
          } else {
            showDialog(context: context, builder: (_) => const ErrorDialog(msg: 'Falha ao salvar!'));
          }
        });
      }
    });
  }
}

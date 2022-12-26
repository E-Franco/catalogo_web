import 'package:flutter/material.dart';

import '../../../../../common/common.dart';
import '../../../core/factories/factories.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../infra/models/models.dart';
import 'categories.dart';

class CategoriesPageMobile extends StatefulWidget {
  const CategoriesPageMobile({
    super.key,
    required this.presenter,
  });

  final CategoriesPresenter presenter;

  @override
  State<CategoriesPageMobile> createState() => _CategoriesPageMobileState();
}

class _CategoriesPageMobileState extends State<CategoriesPageMobile> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () async {
          final r = await showDialog(context: context, builder: (_) => makeNewCategoryPage());
          if (r == true) {
            widget.presenter.fetchCategories();
          }
        },
        child: const Icon(Icons.add),
      ),
      drawer: const SidebarMenu(),
      appBar: const CustomAppBar(),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 50),
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('Categorias', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 50),
          Container(
            width: 500,
            height: MediaQuery.of(context).size.height * 0.075,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Theme.of(context).dividerColor),
              ),
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(Icons.search, size: 30, color: Colors.grey[700]),
                ),
                Expanded(
                  child: TextField(
                    cursorColor: Colors.red,
                    controller: _searchController,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Pesquisar',
                    ),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: _searchController,
                  builder: (context, value, child) {
                    if (_searchController.text.trim().isNotEmpty) {
                      return IconButton(
                        icon: const Icon(Icons.close),
                        iconSize: 25,
                        color: Colors.grey[700],
                        onPressed: () => _searchController.clear(),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            margin: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Nome',
                  style: TextStyle(fontSize: 25, color: Colors.blue[400], fontWeight: FontWeight.w600),
                ),
                // Text(
                //   'Subcategorias',
                //   style: TextStyle(fontSize: 25, color: Colors.blue[400], fontWeight: FontWeight.w600),
                // ),
              ],
            ),
          ),
          const Divider(),
          const SizedBox(height: 20),
          ValueListenableBuilder<UIState>(
            valueListenable: widget.presenter.state,
            builder: (context, value, child) {
              if (value == UIState.success) {
                return ValueListenableBuilder(
                  valueListenable: _searchController,
                  builder: (context, _, child) {
                    List<CategoryEntity> categories = widget.presenter.filterCategories(_searchController.text);
                    List<Widget> children = [];

                    for (int i = 0; i < categories.length; i++) {
                      final CategoryModel category = CategoryModel.fromEntity(categories[i]);

                      children.add(
                        Container(
                          alignment: FractionalOffset.center,
                          height: 75,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 0.5, color: Theme.of(context).dividerColor),
                            ),
                            color: i % 2 == 0 ? Colors.grey[200] : Colors.transparent,
                          ),
                          child: ListTile(
                            title: Text(category.name, style: const TextStyle(fontSize: 25)),
                            onTap: () => Navigator.of(context).pushReplacement(
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) {
                                  return makeSubCategoriesPage(category);
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    }

                    return Column(children: children);
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

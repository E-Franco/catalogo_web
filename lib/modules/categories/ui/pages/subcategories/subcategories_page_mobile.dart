import 'package:catalogo_web/modules/categories/ui/pages/categories/categories.dart';
import 'package:catalogo_web/service_locator.dart';
import 'package:flutter/material.dart';

import '../../../../../common/common.dart';
import '../../../core/factories/pages/pages.dart';
import 'subcategories_presenter.dart';

class SubCategoriesPageMobile extends StatefulWidget {
  const SubCategoriesPageMobile({
    super.key,
    required this.presenter,
  });

  final SubCategoriesPresenter presenter;

  @override
  State<SubCategoriesPageMobile> createState() => _SubCategoriesPageMobileState();
}

class _SubCategoriesPageMobileState extends State<SubCategoriesPageMobile> {
  late TextEditingController _searchController;

  @override
  void initState() {
    widget.presenter.init();
    _searchController = TextEditingController();
    serviceLocator.registerSingleton<SubCategoriesPresenter>(widget.presenter);
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    serviceLocator.unregister<SubCategoriesPresenter>(instance: widget.presenter);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const SidebarMenu(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: add,
        child: const Icon(Icons.add),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 50),
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  widget.presenter.selectedCategory.name,
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 20),
              SizedBox(
                height: 50,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    side: const BorderSide(width: 1, color: Colors.black54),
                    foregroundColor: Colors.black54,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => makeEditCategoryPage(widget.presenter.selectedCategory),
                    ).then((value) {
                      if (value == true) {
                        serviceLocator.get<CategoriesPresenter>().fetchCategories();
                        Navigator.of(context).pushReplacement(PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => makeCategoriesPage(),
                        ));
                      }
                    });
                  },
                  icon: const Icon(Icons.edit_outlined),
                  label: const Text(
                    Labels.edit,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
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
                    final subcategories = widget.presenter.filterSubCategories(_searchController.text);
                    List<Widget> children = [];

                    for (int i = 0; i < subcategories.length; i++) {
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
                              title: Text(subcategories[i].name, style: const TextStyle(fontSize: 25)),
                              onTap: () async {
                                final r = await showDialog(
                                  context: context,
                                  builder: (_) => makeEditSubCategoriesPage(subcategories[i]),
                                );

                                if (r == true) {
                                  widget.presenter.fetchSubCategories();
                                }
                              },
                            ),
                          ),
                      );
                    }

                    if (subcategories.isEmpty) {
                      return const Center(
                        child: Text(
                          Labels.emptySubcategories,
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    } else {
                      return Column(children: children);
                    }
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
    );
  }

  Future<void> add() async {
    final r = await showDialog(
      context: context,
      builder: (_) => makeNewSubCategoryPage(widget.presenter.selectedCategory),
    );

    if (r == true) {
      widget.presenter.fetchSubCategories();
    }
  }
}

import 'package:catalogo_web/modules/categories/ui/pages/categories/categories.dart';
import 'package:catalogo_web/service_locator.dart';
import 'package:flutter/material.dart';

import '../../../../../common/common.dart';
import '../../../core/factories/pages/pages.dart';
import 'subcategories_presenter.dart';

class SubCategoriesPageWeb extends StatefulWidget {
  const SubCategoriesPageWeb({
    super.key,
    required this.presenter,
  });

  final SubCategoriesPresenter presenter;

  @override
  State<SubCategoriesPageWeb> createState() => _SubCategoriesPageWebState();
}

class _SubCategoriesPageWebState extends State<SubCategoriesPageWeb> {
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () async {
          final r = await showDialog(
            context: context,
            builder: (_) => makeNewSubCategoryPage(widget.presenter.selectedCategory),
          );

          if (r == true) {
            setState(() {
              widget.presenter.fetchSubCategories();
            });
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Row(
        children: <Widget>[
          const SidebarMenu(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 50, left: 50, right: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        widget.presenter.selectedCategory.name,
                        style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
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
                  Expanded(
                    child: ValueListenableBuilder<UIState>(
                      valueListenable: widget.presenter.state,
                      builder: (context, value, child) {
                        if (value == UIState.success) {
                          return ValueListenableBuilder(
                            valueListenable: _searchController,
                            builder: (context, _, child) {
                              final subcategories = widget.presenter.filterSubCategories(_searchController.text);

                              if (subcategories.isEmpty) {
                                return const Center(
                                  child: Text(
                                    Labels.emptySubcategories,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                );
                              } else {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(bottom: 50),
                                  physics: const BouncingScrollPhysics(),
                                  itemExtent: MediaQuery.of(context).size.height * 0.1,
                                  itemCount: subcategories.length,
                                  itemBuilder: (context, index) {
                                    final subcategory = subcategories[index];

                                    return Container(
                                      alignment: FractionalOffset.center,
                                      height: 75,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(width: 0.5, color: Theme.of(context).dividerColor),
                                        ),
                                        color: index % 2 == 0 ? Colors.grey[200] : Colors.transparent,
                                      ),
                                      child: ListTile(
                                        title: Text(subcategory.name, style: const TextStyle(fontSize: 25)),
                                        onTap: () async {
                                          final r = await showDialog(
                                            context: context,
                                            builder: (_) => makeEditSubCategoriesPage(subcategory),
                                          );

                                          if (r == true) {
                                            widget.presenter.fetchSubCategories();
                                          }
                                        },
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                          );
                        } else {
                          return const Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

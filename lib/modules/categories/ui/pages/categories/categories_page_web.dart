import 'package:flutter/material.dart';

import '../../../../../common/common.dart';
import '../../../core/factories/factories.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../infra/models/models.dart';
import 'categories.dart';

class CategoriesPageWeb extends StatefulWidget {
  const CategoriesPageWeb({
    super.key,
    required this.presenter,
  });

  final CategoriesPresenter presenter;

  @override
  State<CategoriesPageWeb> createState() => _CategoriesPageWebState();
}

class _CategoriesPageWebState extends State<CategoriesPageWeb> {
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
      body: Row(
        children: <Widget>[
          const SidebarMenu(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 50, left: 50, right: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Categorias', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
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
                  Expanded(
                    child: ValueListenableBuilder<UIState>(
                      valueListenable: widget.presenter.state,
                      builder: (context, value, child) {
                        if (value == UIState.success) {
                          return ValueListenableBuilder(
                            valueListenable: _searchController,
                            builder: (context, _, child) {
                              List<CategoryEntity> categories =
                                  widget.presenter.filterCategories(_searchController.text);

                              return ListView.builder(
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(bottom: 50),
                                physics: const BouncingScrollPhysics(),
                                itemExtent: MediaQuery.of(context).size.height * 0.1,
                                itemCount: categories.length,
                                itemBuilder: (context, index) {
                                  final CategoryModel category = CategoryModel.fromEntity(categories[index]);
                                  // final category = categories[index];

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
                                      title: Text(category.name, style: const TextStyle(fontSize: 25)),
                                      // trailing: SizedBox(
                                      //   width: MediaQuery.of(context).size.width * 0.15,
                                      //   // child: Text(
                                      //   //   category.subCategoriesCount.toString(),
                                      //   //   textAlign: TextAlign.end,
                                      //   //   style: GoogleFonts.raleway(fontSize: 25),
                                      //   // ),
                                      // ),
                                      onTap: () => Navigator.of(context).pushReplacement(
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation, secondaryAnimation) {
                                            return makeSubCategoriesPage(category);
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
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

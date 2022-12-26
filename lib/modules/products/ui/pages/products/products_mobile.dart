import 'package:catalogo_web/modules/products/core/factories/pages/edit_product/edit_product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../common/common.dart';
import '../../../core/factories/factories.dart';
import '../../../domain/entities/entities.dart';
import 'products_presenter.dart';

class ProductsPageMobile extends StatefulWidget {
  const ProductsPageMobile({super.key, required this.presenter});
  final ProductsPresenter presenter;

  @override
  State<ProductsPageMobile> createState() => _ProductsPageMobileState();
}

class _ProductsPageMobileState extends State<ProductsPageMobile> {
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
      drawer: const SidebarMenu(),
      appBar: const CustomAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () => Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return makeNewProductPage();
            },
          ),
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 50),
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text('Produtos', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 30),
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
                Text(
                  'Código',
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
                    List<ProductEntity> temp = widget.presenter.filteredProducts(_searchController.text);
                    List<Widget> children = [];

                    for (int i = 0; i < temp.length; i++) {
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
                            title: Text(temp[i].name, style: const TextStyle(fontSize: 25)),
                            trailing: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                              child: Text(
                                temp[i].code.toString(),
                                textAlign: TextAlign.end,
                                style: GoogleFonts.raleway(fontSize: 25),
                              ),
                            ),
                            onTap: () => Navigator.of(context).pushReplacement(
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) {
                                  return makeEditProductPage(temp[i]);
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    }

                    return Column(
                      children: children,
                    );
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

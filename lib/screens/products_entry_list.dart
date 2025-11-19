import 'package:flutter/material.dart';
import 'package:football_shop/models/products_entry.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/screens/products_detail.dart';
import 'package:football_shop/widgets/products_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductsEntryListPage extends StatefulWidget {
  final bool userProductsOnly;

  const ProductsEntryListPage({super.key, this.userProductsOnly = false});

  @override
  State<ProductsEntryListPage> createState() => _ProductsEntryListPageState();
}

class _ProductsEntryListPageState extends State<ProductsEntryListPage> {
  Future<List<ProductsEntry>> fetchProducts(CookieRequest request) async {
    // Use different endpoint based on userProductsOnly flag
    final url = widget.userProductsOnly
        ? 'http://localhost:8000/json/user-products/' // New endpoint for user products
        : 'http://localhost:8000/json/';

    final response = await request.get(url);

    // Convert json data to ProductsEntry objects
    List<ProductsEntry> listProducts = [];
    for (var d in response) {
      if (d != null) {
        listProducts.add(ProductsEntry.fromJson(d));
      }
    }
    return listProducts;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userProductsOnly ? 'My Products' : 'All Products'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.userProductsOnly
                        ? 'You haven\'t added any products yet.'
                        : 'There are no products in football shop yet.',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xff59A5D8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductsEntryCard(
                  products: snapshot.data![index],
                  onTap: () {
                    // Navigate to products detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductsDetailPage(product: snapshot.data![index]),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}

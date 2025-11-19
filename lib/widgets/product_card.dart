import 'package:flutter/material.dart';
import 'package:football_shop/screens/productsentry_form.dart';
import 'package:football_shop/screens/products_entry_list.dart';
import 'package:football_shop/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;
  final Color textColor;

  ItemHomepage(this.name, this.icon, this.color, this.textColor);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: item.color, // Menggunakan warna dari item
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          // Menampilkan SnackBar dengan pesan sesuai tombol yang ditekan
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}"),
                duration: const Duration(seconds: 2),
              ),
            );
          // Navigasi ke halaman yang sesuai
          if (item.name == "Create Product") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductEntryFormPage(),
              ),
            );
          } else if (item.name == "All Products") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductsEntryListPage(),
              ),
            );
          } else if (item.name == "My Products") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const ProductsEntryListPage(userProductsOnly: true),
              ),
            );
          }
        },
        child: SizedBox.expand(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item.icon, color: Colors.white, size: 30.0),
                  const Padding(padding: EdgeInsets.all(3)),
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: item.textColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

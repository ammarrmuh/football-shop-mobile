import 'package:flutter/material.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:football_shop/screens/productentry_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(                                    // Widget Drawer
      child: ListView(                                // ListView berisi children
        children: [
          DrawerHeader(                               // Header Drawer
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,  // Warna biru
            ),
            child: const Column(
              children: [
                Text(
                  'Football Shop',                   // Judul
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Belanja perlengkapan football favoritmu di sini!",  // Subtitle
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          // Menu Item 1: Halaman Utama
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            onTap: () {
              Navigator.pushReplacement(              // Ganti halaman
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
          // Menu Item 2: Tambah Produk
          ListTile(
            leading: const Icon(Icons.add_circle),
            title: const Text('Tambah Produk'),
            onTap: () {
              Navigator.push(                         // Tambah halaman ke stack
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEntryFormPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
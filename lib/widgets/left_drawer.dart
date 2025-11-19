import 'package:flutter/material.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:football_shop/screens/productsentry_form.dart';
import 'package:football_shop/screens/products_entry_list.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:football_shop/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Drawer(
      // Widget Drawer
      child: ListView(
        // ListView berisi children
        children: [
          DrawerHeader(
            // Header Drawer
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary, // Warna biru
            ),
            child: const Column(
              children: [
                Text(
                  'Football Shop', // Judul
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Belanja perlengkapan football favoritmu di sini!", // Subtitle
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
              Navigator.pushReplacement(
                // Ganti halaman
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          // Menu Item 2: Tambah Produk
          ListTile(
            leading: const Icon(Icons.add_circle),
            title: const Text('Tambah Produk'),
            onTap: () {
              Navigator.push(
                // Tambah halaman ke stack
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEntryFormPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_reaction_rounded),
            title: const Text('Product List'),
            onTap: () {
              // Route to products list page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductsEntryListPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.inventory),
            title: const Text('My Products'),
            onTap: () {
              // Route to user products list page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const ProductsEntryListPage(userProductsOnly: true),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              final response = await request.logout(
                'http://localhost:8000/auth/logout/',
              );
              final message = response['message'] ?? 'Logged out';
              if (!context.mounted) return;
              if (response['status'] == true) {
                final uname = response['username'] ?? '';
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$message See you again, $uname.')),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginApp()),
                );
              } else {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(message)));
              }
            },
          ),
        ],
      ),
    );
  }
}

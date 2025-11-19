import 'package:flutter/material.dart';
import 'package:football_shop/models/products_entry.dart';

class ProductsDetailPage extends StatelessWidget {
  final ProductsEntry product;

  const ProductsDetailPage({super.key, required this.product});

  String _formatDate(DateTime date) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  String _formatPrice(int price) {
    return 'Rp ${price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), 
      (Match m) => '${m[1]}.'
    )}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product image
                  if (product.thumbnail != null && product.thumbnail!.isNotEmpty)
                    Image.network(
                      'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail!)}',
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 300,
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(Icons.inventory_2, size: 80, color: Colors.grey),
                        ),
                      ),
                    )
                  else
                    Container(
                      height: 300,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.inventory_2, size: 80, color: Colors.grey),
                      ),
                    ),
                  
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Featured badge and Category
                        Row(
                          children: [
                            if (product.isFeatured)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 6.0),
                                margin: const EdgeInsets.only(right: 8.0),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.star, size: 14, color: Colors.black87),
                                    SizedBox(width: 4),
                                    Text(
                                      'Featured',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 4.0),
                              decoration: BoxDecoration(
                                color: Colors.indigo.shade100,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Text(
                                product.category.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo.shade700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Product name
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Price
                        Text(
                          _formatPrice(product.price),
                          style: const TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Stock availability
                        Row(
                          children: [
                            Icon(
                              product.quantity > 0 ? Icons.check_circle : Icons.cancel,
                              color: product.quantity > 0 ? Colors.green : Colors.red,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              product.quantity > 0 
                                  ? 'In Stock (${product.quantity} available)' 
                                  : 'Out of Stock',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: product.quantity > 0 ? Colors.green : Colors.red,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        const Divider(height: 32),

                        // Description section
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          product.description,
                          style: const TextStyle(
                            fontSize: 16.0,
                            height: 1.6,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom action bar
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: product.quantity > 0 ? () {
                        // Add to cart functionality
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product.name} added to cart'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      } : null,
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        disabledBackgroundColor: Colors.grey,
                        disabledForegroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/model/product.dart';
import 'package:riverpod_demo/pages/cart_notifier.dart';

class ChangeNotifierProviderPage extends ConsumerWidget {
  const ChangeNotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier = ref.watch(cartNotifierProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Change Notifier Provider'),
          actions: [
            Stack(
              children: [
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Cart'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ...cartNotifier.cart
                                    .map((item) => Text(item.title)),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                    "Total: Rs.${cartNotifier.cart.fold(0, (sum, item) => sum + item.price)}")
                              ],
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    ref
                                        .read(cartNotifierProvider.notifier)
                                        .clearCart();
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Clear'))
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.shopping_cart)),
                Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      constraints:
                          const BoxConstraints(minWidth: 16, minHeight: 16),
                      child: Text(
                        cartNotifier.cart.length.toString(),
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ))
              ],
            )
          ],
        ),
        body: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            final product = productList[index];
            return ListTile(
              title: Text(product.title),
              subtitle: Text(
                "Rs. ${product.price}",
                style: const TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                  onPressed: () {
                    ref.read(cartNotifierProvider.notifier).addProduct(product);
                  },
                  icon: const Icon(Icons.add_shopping_cart_outlined)),
            );
          },
        ));
  }
}

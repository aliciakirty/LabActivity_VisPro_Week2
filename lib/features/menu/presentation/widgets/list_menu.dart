import 'package:flutter/material.dart';
import '../../domain/menu_item.dart';
import 'price_tag.dart';

class MenuList extends StatelessWidget {
  const MenuList({
    super.key,
    required this.items,
    required this.quantities,
    required this.controller,
    required this.onQuantityChanged,
  });

  final List<MenuItem> items;
  final Map<String, int> quantities;
  final ScrollController controller;
  final void Function(String id, int quantity) onQuantityChanged;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        MenuItem item = items[index];
        int qty = quantities[item.id] ?? 0;

        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              item.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          if (item.promo) const SizedBox(width: 6),
                          if (item.promo)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'PROMO',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onTertiaryContainer,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 6),

                      // Price
                      PriceTag(price: item.price),
                    ],
                  ),
                ),

                // Minus
                IconButton(
                  onPressed: qty == 0
                      ? null
                      : () {
                    onQuantityChanged(item.id, qty - 1);
                  },
                  icon: const Icon(Icons.remove_circle_outline),
                ),

                // Quantity
                SizedBox(
                  width: 28,
                  child: Text(
                    '$qty',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                // Plus
                IconButton(
                  onPressed: qty >= 99
                      ? null
                      : () {
                    onQuantityChanged(item.id, qty + 1);
                  },
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
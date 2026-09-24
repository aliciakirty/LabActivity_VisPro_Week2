import 'package:flutter/material.dart';

import 'price_tag.dart';

class OrderSummaryBar extends StatelessWidget {
  const OrderSummaryBar({
    super.key,
    required this.lineCount,
    required this.total,
    required this.onSave,
  });

  final int lineCount;
  final int total;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lineCount == 0
                      ? 'Belum ada pesanan'
                      : '$lineCount menu dipilih',
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 4),
                PriceTag(price: total),
              ],
            ),
          ),
          FilledButton(
            onPressed: total == 0 ? null : onSave,
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }
}
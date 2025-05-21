import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notu/app/pages/home_page/provider/home_page_provider.dart';
import 'package:provider/provider.dart';

class CategoryBar extends StatelessWidget {
  const CategoryBar({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomePageProvider>();
    final categories = provider.categories;
    final selectedIndex = provider.selectedCategoryIndex;

    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(categories.length, (idx) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ChoiceChip(
                label: Text(categories[idx]),
                selected: idx == selectedIndex,
                onSelected: (_) => provider.setSelectedCategoryIndex(idx),
              ),
            );
          }),
        ),
      ),
    );
  }
}

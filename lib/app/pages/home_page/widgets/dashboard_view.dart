import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notu/app/pages/home_page/provider/home_page_provider.dart';
import 'package:notu/app/pages/home_page/widgets/category_bar.dart';
import 'package:notu/app/pages/home_page/widgets/header_bar.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomePageProvider>();
    final selectedCategory =
        provider.categories.isNotEmpty &&
                provider.selectedCategoryIndex < provider.categories.length
            ? provider.categories[provider.selectedCategoryIndex]
            : null;

    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // Background
        Positioned.fill(child: Container(color: Colors.black54)),
        // Main content offset by 40px
        Positioned(
          top: 40,
          left: 0,
          right: 0,
          height: screenHeight - 35,
          child: Column(
            children: [
              HeaderBar(),
              CategoryBar(),
              Expanded(
                child:
                    selectedCategory != null
                        ? ListView.builder(
                          itemCount: 45,
                          itemBuilder:
                              (context, index) => ListTile(
                                title: Text('Test $index'),
                                subtitle: Text('Subtitle $index'),
                              ),
                        )
                        : Center(child: Text('No notes available')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

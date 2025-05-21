import 'package:flutter/material.dart';
import 'package:notu/app/pages/home_page/provider/home_page_provider.dart';
import 'package:notu/app/pages/home_page/widgets/category_bar.dart';
import 'package:notu/app/pages/home_page/widgets/dashboard_view.dart';
import 'package:notu/app/widgets/base/base_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageProvider>(
      lazy: true,
      create: (_) => HomePageProvider(),
      child: DashboardView(),
    );
  }
}

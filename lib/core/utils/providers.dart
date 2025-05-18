import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:notu/app/widgets/side_menu/provider/side_menu_controller.dart';
import 'package:provider/single_child_widget.dart';
// import other controllers here

class AppProviders {
  static List<SingleChildWidget> get providers => [
    ChangeNotifierProvider(create: (_) => SideMenuController()),
    // Add more providers here:
    // ChangeNotifierProvider(create: (_) => AuthController()),
    // Provider(create: (_) => SomeService()),
  ];
}

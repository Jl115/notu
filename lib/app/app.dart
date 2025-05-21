import 'package:flutter/material.dart';
import 'package:notu/app/widgets/base/base_widget.dart';
import 'package:notu/core/utils/routes.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: BaseWidget());
  }
}

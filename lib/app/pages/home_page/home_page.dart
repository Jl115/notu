import 'package:flutter/material.dart';
import 'package:notu/app/widgets/base/base_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const BaseWidget(
        child: Center(child: Text('Welcome to the Home Page!')),
      ),
    );
  }
}

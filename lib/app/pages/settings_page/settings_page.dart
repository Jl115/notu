import 'package:flutter/material.dart';
import 'package:notu/app/widgets/base/base_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const BaseWidget(
        child: Center(child: Text('Welcome to the Settings Page!')),
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:notu/core/utils/providers.dart';
import 'package:provider/provider.dart'; // <-- Add this
import 'package:notu/app/app.dart';
import 'package:notu/core/database/db.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  await AppDatabase.instance;

  runApp(
    MultiProvider(providers: AppProviders.providers, child: const MainApp()),
  );
}

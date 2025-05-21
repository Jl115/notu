import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:notu/app/providers/router_provider.dart';
// import other controllers here

class AppProviders {
  static List<SingleChildWidget> get providers => [
    ChangeNotifierProvider(create: (_) => RouterProvider()),
    // Add more providers here:
    // ChangeNotifierProvider(create: (_) => AuthController()),
    // Provider(create: (_) => SomeService()),
  ];
}

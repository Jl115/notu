import 'package:flutter/material.dart';
import 'package:notu/app/widgets/side_menu/service/side_menu_display_mode.dart';
import 'package:notu/core/utils/routes.dart';

class SideMenuController with ChangeNotifier {
  int _currentPage;
  SideMenuDisplayMode _displayMode = SideMenuDisplayMode.open;

  SideMenuController({int initialPage = 0}) : _currentPage = initialPage;

  int get currentPage => _currentPage;
  SideMenuDisplayMode get displayMode => _displayMode;

  Color get toggleColor =>
      _displayMode == SideMenuDisplayMode.open ? Colors.black : Colors.grey;

  void changePage(int index, {String? routeName, BuildContext? context}) {
    if (_currentPage != index) {
      _currentPage = index;
      if (context != null && routeName != null) {
        _replaceWithoutAnimation(context, routeName);
      }
      notifyListeners();
    }
  }

  void _replaceWithoutAnimation(BuildContext context, String routeName) {
    final route = AppRoutes.generateRoute(RouteSettings(name: routeName));

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        settings: route.settings,
        pageBuilder: (_, __, ___) {
          if (route is MaterialPageRoute) {
            return route.builder(context);
          }
          throw Exception('Unsupported route type: ${route.runtimeType}');
        },
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  void toggleDisplayMode() {
    _displayMode =
        _displayMode == SideMenuDisplayMode.open
            ? SideMenuDisplayMode.compact
            : SideMenuDisplayMode.open;
    notifyListeners();
  }
}

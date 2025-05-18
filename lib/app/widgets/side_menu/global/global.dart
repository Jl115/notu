import 'package:flutter/widgets.dart';
import 'package:notu/app/widgets/side_menu/provider/side_menu_controller.dart';
import 'package:notu/app/widgets/side_menu/service/side_menu_display_mode.dart';
import 'package:notu/app/widgets/side_menu/service/side_menu_style.dart';

class Global {
  late SideMenuController controller;
  late SideMenuStyle style;
  DisplayModeNotifier displayModeState = DisplayModeNotifier(
    SideMenuDisplayMode.auto,
  );
  bool showTrailing = true;
  List<Function> itemsUpdate = [];
  List items = [];
  List<bool> expansionStateList = [];
}

class DisplayModeNotifier extends ValueNotifier<SideMenuDisplayMode> {
  DisplayModeNotifier(SideMenuDisplayMode value) : super(value);

  void change(SideMenuDisplayMode mode) {
    if (value != mode) {
      value = mode;
      notifyListeners();
    }
  }
}

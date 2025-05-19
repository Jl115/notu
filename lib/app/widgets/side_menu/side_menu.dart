import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:notu/app/widgets/side_menu/provider/side_menu_controller.dart';
import 'package:notu/app/widgets/side_menu/service/side_menu_display_mode.dart';
import 'package:notu/app/widgets/side_menu/service/side_menu_style.dart';
import 'package:notu/app/widgets/side_menu/widgets/side_menu_toggle.dart';
import 'package:notu/app/widgets/side_menu/side_menu_hamburger_mode.dart';

class SideMenu extends StatelessWidget {
  final List<Widget>? topItems;
  final List<Widget> bottomItems;
  final SideMenuStyle? style;
  final bool? showToggle;

  const SideMenu({
    super.key,
    required this.bottomItems,
    this.topItems,
    this.style,
    this.showToggle,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SideMenuController>();
    final displayMode = controller.displayMode;
    final SideMenuStyle sideMenuStyle = style ?? SideMenuStyle();

    if (displayMode == SideMenuDisplayMode.hamburger && topItems != null) {
      return SideMenuHamburgerWidget(items: topItems!);
    }

    final double width = switch (displayMode) {
      SideMenuDisplayMode.compact => sideMenuStyle.compactSideMenuWidth!,
      SideMenuDisplayMode.open => sideMenuStyle.openSideMenuWidth!,
      SideMenuDisplayMode.auto => sideMenuStyle.openSideMenuWidth!,
      SideMenuDisplayMode.hamburger => sideMenuStyle.openSideMenuWidth!,
    };

    final decoration =
        sideMenuStyle.decoration ??
        BoxDecoration(color: sideMenuStyle.backgroundColor ?? Colors.white);
    return SafeArea(
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx < -10 &&
              controller.displayMode == SideMenuDisplayMode.open) {
            controller.toggleDisplayMode();
          } else if (details.delta.dx > 10 &&
              controller.displayMode == SideMenuDisplayMode.compact) {
            controller.toggleDisplayMode();
          }
        },
        child: Container(
          width: width,
          decoration: decoration,
          child: Column(
            children: [
              if ((showToggle ?? false))
                SideMenuToggle(
                  toggleColor: sideMenuStyle.toggleColor,
                  onTap: controller.toggleDisplayMode,
                ),
              if (topItems != null)
                Expanded(
                  flex: 2,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: topItems!,
                  ),
                ),
              if (topItems == null) Expanded(flex: 2, child: SizedBox.shrink()),
              SizedBox(height: 120, child: Column(children: bottomItems)),
            ],
          ),
        ),
      ),
    );
  }
}

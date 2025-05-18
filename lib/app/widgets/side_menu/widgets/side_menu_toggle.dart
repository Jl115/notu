import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:notu/app/widgets/side_menu/provider/side_menu_controller.dart';
import 'package:notu/app/widgets/side_menu/service/side_menu_display_mode.dart';

class SideMenuToggle extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? toggleColor;

  const SideMenuToggle({super.key, required this.onTap, this.toggleColor});

  @override
  Widget build(BuildContext context) {
    final displayMode = context.watch<SideMenuController>().displayMode;

    return Padding(
      padding: EdgeInsets.only(
        top: displayMode == SideMenuDisplayMode.open ? 4 : 0,
        right: displayMode == SideMenuDisplayMode.open ? 0 : 2,
      ),
      child: IconButton(
        color: toggleColor ?? Colors.black,
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder:
              (child, anim) => RotationTransition(
                turns:
                    child.key == const ValueKey('Sidemenu_icon1')
                        ? Tween<double>(begin: 1, end: 0.5).animate(anim)
                        : Tween<double>(begin: 0.5, end: 1).animate(anim),
                child: FadeTransition(opacity: anim, child: child),
              ),
          child:
              displayMode == SideMenuDisplayMode.open
                  ? const Icon(
                    Icons.navigate_next,
                    key: ValueKey('Sidemenu_icon1'),
                    size: 30,
                  )
                  : const Icon(
                    Icons.navigate_next,
                    key: ValueKey('Sidemenu_icon2'),
                    size: 30,
                  ),
        ),
        onPressed: onTap,
      ),
    );
  }
}

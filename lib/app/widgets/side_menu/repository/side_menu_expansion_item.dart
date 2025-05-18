import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:notu/app/widgets/side_menu/provider/side_menu_controller.dart';
import 'package:notu/app/widgets/side_menu/service/side_menu_display_mode.dart';
import 'side_menu_item.dart';

class SideMenuExpansionItem extends StatelessWidget {
  final String? title;
  final Icon? icon;
  final Widget? iconWidget;
  final List<SideMenuItem> children;
  final int index;
  final void Function(int index)? onTap;

  const SideMenuExpansionItem({
    super.key,
    this.title,
    this.icon,
    this.iconWidget,
    required this.children,
    required this.index,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SideMenuController>();
    final isOpen = controller.displayMode == SideMenuDisplayMode.open;

    return ExpansionTile(
      initiallyExpanded: controller.currentPage == index,
      leading: icon ?? iconWidget,
      title: isOpen ? Text(title ?? '') : const SizedBox.shrink(),
      children: children,
      onExpansionChanged: (expanded) {
        if (expanded) {
          controller.changePage(index);
          onTap?.call(index);
        }
      },
    );
  }
}

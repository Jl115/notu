import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:notu/app/widgets/side_menu/provider/side_menu_controller.dart';
import 'package:notu/app/widgets/side_menu/service/side_menu_display_mode.dart';

typedef SideMenuItemBuilder =
    Widget Function(BuildContext context, SideMenuDisplayMode displayMode);

class SideMenuItem extends StatelessWidget {
  final void Function()? onTap;
  final String? title;
  final Icon? icon;
  final Widget? iconWidget;
  final Widget? badgeContent;
  final Color? badgeColor;
  final String? tooltipContent;
  final Widget? trailing;
  final SideMenuItemBuilder? builder;
  final int index;

  const SideMenuItem({
    super.key,
    required this.index,
    this.onTap,
    this.title,
    this.icon,
    this.iconWidget,
    this.badgeContent,
    this.badgeColor,
    this.tooltipContent,
    this.trailing,
    this.builder,
  }) : assert(
         title != null || icon != null || builder != null,
         'Title, icon and builder should not all be null',
       );

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SideMenuController>();
    final displayMode = controller.displayMode;
    final isSelected = controller.currentPage == index;

    return ListTile(
      selected: isSelected,
      leading: icon ?? iconWidget,
      title: displayMode == SideMenuDisplayMode.open ? Text(title ?? '') : null,
      trailing: trailing,
      onTap: onTap,
    );
  }
}

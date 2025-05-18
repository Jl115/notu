import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:notu/core/constants/color_constant.dart';
import 'package:notu/core/utils/common.dart';
import 'package:provider/provider.dart';

class BaseScreen<T extends ChangeNotifier> extends StatelessWidget {
  const BaseScreen({
    Key? key,
    required this.provider,
    this.appBar,
    this.drawer,
    this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.padding,
    this.backgroundGradient,
  }) : super(key: key);

  final T provider;
  final PreferredSizeWidget? appBar;
  final Drawer? drawer;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final EdgeInsetsGeometry? padding;
  final Gradient? backgroundGradient;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: provider,
      child: Consumer<T>(
        builder: (context, model, child) {
          // You can add additional actions based on the model's state here.
          // For example:
          // if (model.isLoaded) print("⚡ Settings Loaded Successfully!");

          return Container(
            decoration: BoxDecoration(
              gradient:
                  backgroundGradient ??
                  LinearGradient(
                    colors:
                        Theme.of(context).brightness == Brightness.dark
                            ? [
                              ColorConstants.darkPrimary,
                              ColorConstants.darkAccent,
                            ]
                            : [
                              ColorConstants.lightPrimary,
                              ColorConstants.lightAccent,
                            ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
            ),
            child: Scaffold(
              appBar: appBar,
              body: GestureDetector(
                onTap: () => removeFocus(),
                child: Padding(
                  padding: padding ?? const EdgeInsets.symmetric(horizontal: 0),
                  child: body,
                ),
              ),
              backgroundColor: Colors.transparent,
              drawer: drawer,
              floatingActionButton: floatingActionButton,
              bottomNavigationBar: bottomNavigationBar,
            ),
          );
        },
      ),
    );
  }
}

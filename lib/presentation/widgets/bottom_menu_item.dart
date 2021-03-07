import 'package:flutter/material.dart';

enum BottomMenu { menu_all, menu_processing, menu_done }

String menuItemName(BottomMenu layoutType, BuildContext context) {
  switch (layoutType) {
    case BottomMenu.menu_all:
      return 'All';
    case BottomMenu.menu_processing:
      return 'Processing';
    case BottomMenu.menu_done:
      return 'Completed';
    default:
      return '';
  }
}

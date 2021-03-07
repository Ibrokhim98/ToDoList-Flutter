import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/domain/providers/main_provider.dart';
import 'bottom_menu_item.dart';

class BottomNavBar extends StatelessWidget {
  final MainProvider mainProvider;
  final BuildContext baseContext;

  BottomNavBar({this.mainProvider, this.baseContext});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      backgroundColor: Colors.white70,
      items: <BottomNavigationBarItem>[
        _buildMenuItem(
          title: "All",
          icon: Icon(
            Icons.border_all,
            color: _setMenuItemColor(bottomMenu: BottomMenu.menu_all),
          ),
          bottomMenu: BottomMenu.menu_all,
        ),
        _buildMenuItem(
          title: "Processing",
          icon: Icon(
            Icons.timer,
            color: _setMenuItemColor(bottomMenu: BottomMenu.menu_processing),
          ),
          bottomMenu: BottomMenu.menu_processing,
        ),
        _buildMenuItem(
          title: "Completed",
          icon: Icon(
            Icons.done,
            color: _setMenuItemColor(bottomMenu: BottomMenu.menu_done),
          ),
          bottomMenu: BottomMenu.menu_done,
        ),
      ],
      onTap: (index) {
        mainProvider.changeIndex(index);
        print(mainProvider.index);
      },
    );
  }

  BottomNavigationBarItem _buildMenuItem({Widget icon, BottomMenu bottomMenu, String title}) {
    return BottomNavigationBarItem(
      icon: icon,
      title: Text(
        title,
        style: TextStyle(color: mainProvider.index == bottomMenu.index ? Colors.lightBlue : Colors.black54),
      ),
    );
  }

  Color _setMenuItemColor({BottomMenu bottomMenu}) => mainProvider.index == bottomMenu.index ? Colors.lightBlue : Colors.black54;
}

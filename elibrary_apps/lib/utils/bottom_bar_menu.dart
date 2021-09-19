import 'package:elibrary_apps/ui_screen/page_profile.dart';
import 'package:flutter/material.dart';

class BottomBarMenu extends StatefulWidget {
  @override
  _BottomBarMenuState createState() => _BottomBarMenuState();
}

class _BottomBarMenuState extends State<BottomBarMenu> {

  int _selectedIndex = 0;

  final _widgetOptions = [
    PageProfile(),
    PageProfile(),
    PageProfile(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
            items: [
        BottomNavigationBarItem(icon: Icon(Icons.home));
    BottomNavigationBarItem(icon: Icon(Icons.message_outlined));
    BottomNavigationBarItem(icon: Icon(Icons.person_add_alt_1_outlined));

    ],

    type: BottomNavigationBarType.fixed,
    currentIndex: _selectedIndex,
    fixedColor: Color(0xff34A0A4),
    onTap: _onItemTapped
    ,
    )
    ,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

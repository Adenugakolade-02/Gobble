import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  
  const BottomNavBar({Key? key, required this.selectedIndex, required this.onItemTapped}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<BottomNavigationBarItem> _items = const[
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: "Home"
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.star),
      label: "Favourite"
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined),
      label: "Cart"
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: "Account"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _items,
      currentIndex: widget.selectedIndex,
      onTap: widget.onItemTapped,
      selectedItemColor: const Color(0xFF54B175),
      unselectedItemColor: const Color(0xFF030303),
      selectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, fontFamily:'Gilroy', color: Color(0xFF54B175)),
      unselectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, fontFamily:'Gilroy', color: Color(0xFF030303)),
      
    );
  }
}
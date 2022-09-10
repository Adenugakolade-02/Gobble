import 'package:flutter/material.dart';
import 'package:gobble/widgets/bottom_navigation_bar.dart';
import 'package:gobble/widgets/forms/search_form_field.dart';
import 'package:gobble/widgets/home_screen_widgets/display_product.dart';

import '../utils/dimensions.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int _selectedIndex = 0;

  List<Widget> navList = [
    Expanded(child: DisPlayWidget()),
    Expanded(child: DisPlayWidget()),
    Expanded(child: DisPlayWidget()),
    Expanded(child: Container(color: Colors.black,)),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(selectedIndex: _selectedIndex, onItemTapped: (index)=>_onItemTapped(index),),
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: getHeight(context, 25)),
      child: SafeArea(
          child: Column(children: <Widget>[
            SizedBox(height: getHeight(context,10)),
        const Center(
            child: Text('Gobble',
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color(0xFF53B175)))),
      SizedBox(height: getHeight(context,10)),
      SearchField(function: (_){}),
      SizedBox(height: getHeight(context,30)),
      navList.elementAt(_selectedIndex)
      ])),
    ));
  }
}

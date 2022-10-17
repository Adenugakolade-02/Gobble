import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:gobble/model/auth_provider.dart';
import 'package:gobble/model/user_preference.dart';
import 'package:gobble/screens/favourite_screen.dart';
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
    Expanded(child: FavouriteScreen()),
    Expanded(child: DisPlayWidget()),
    Expanded(child: Container(color: Colors.grey)),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  // Future<void> start() async{
  //   await UserPreference().startTime();
  // }

  @override
  void initState() {
    // start();
    // UserPreference().startTime();
    // Timer(Duration(seconds: 30), (){print("Timer is done!");});
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // context.read<AuthProvider>().startTime(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(selectedIndex: _selectedIndex, onItemTapped: (index)=>_onItemTapped(index),),
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: getHeight(context, 25)),
      child: Column(
        children: [
          navList.elementAt(_selectedIndex),
        ],
      )
    ));
  }
}

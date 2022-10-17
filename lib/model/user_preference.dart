import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:gobble/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserPreference{

  Future<void> saveUser(User user) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    
    DateTime expiredDate = DateTime.now().add(Duration(minutes: 5));
    prefs.setInt("userId", user.id);
    prefs.setString("name", user.name);
    prefs.setString("email", user.email);
    prefs.setString("token", user.token);
    // prefs.setBool("isLoggedIn", true);
    prefs.setString("expiredDate", expiredDate.toIso8601String());
  }

  Future<User> getUser() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name  = prefs.getString("name");
    String? email = prefs.getString("email");
    String? token = prefs.getString("token");
    int? id = prefs.getInt("id");

    return User(id: id!, name:name!, email: email!, token: token!);
  }

  Future<void> removeUser() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("name");
    prefs.remove("email");
    prefs.remove("token");
    prefs.remove("id");
    prefs.remove("isLoggedIn");
    prefs.remove("expiredDate");

  }

  Future<String> getToken() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString("token");
    return token!;
  }

  // Future<String?> getToken1() async{
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   String? token = prefs.getString("token");
  //   return token;
  // }

  Future<bool?> isLoggedIn() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("expiredDate")==null){
      return false;
    }
    else{
      DateTime expiredDate = DateTime.parse(prefs.getString("expiredDate")!);

      if(expiredDate.isBefore(DateTime.now())){
        // await startTime();
        return true;
      }
      else{
        await removeUser();
        return false;
      }
    }
  }

  Future<DateTime> getExpiredDateTime() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime expiredDate = DateTime.parse(prefs.getString("expiredDate")!);
    return expiredDate;
  }

  // Future<void> startTime(BuildContext context) async{
  //   // print("Started timer count");
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   DateTime expiredDate = DateTime.parse(prefs.getString("expiredDate")!);

  //   Timer(Duration(seconds: expiredDate.difference(DateTime.now()).inSeconds), () async{
  //     print("done");
  //     await removeUser();
  //     Navigator.of(context).pushReplacementNamed('/login');
  //     });
  //   // print("finished timer count");

  // }
  
}
// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gobble/model/app_constants.dart';
import 'package:gobble/model/user.dart';
import 'package:gobble/model/user_preference.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

enum Status{
  notLoggedIn,
  notRegistered,
  loggedIn,
  registered,
  authenticating,
  registering,
  loggedOut
}

class AuthProvider extends  ChangeNotifier{
  Status _loggedInStatus = Status.notLoggedIn;
  Status __registeredStatus = Status.notRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredStatus => __registeredStatus;

  Future<Map<String, dynamic>> login(String email, String passWord) async{
    var result;

    final Map<String, dynamic> loginData = {
    "email":email,
    "password":passWord
    };

    _loggedInStatus = Status.authenticating;
    notifyListeners();

    Uri logInUri = Uri.parse(AppConstant.logIn);

    Response response = await http.post(
      logInUri,
      body: json.encode(loginData),
      headers: {'Content-Type': 'application/json'}
    );

    if(response.statusCode==200){
      final Map<String, dynamic> responseData = json.decode(response.body);

      var userData = responseData;

      User authUser = User.fromJson(userData);

      UserPreference().saveUser(authUser);
      _loggedInStatus = Status.loggedIn;
      notifyListeners();

      result = {
        "status":true,
        "message":"Logged In Sucessfully"
      };

      return result;
    }else{
      _loggedInStatus = Status.notLoggedIn;
      notifyListeners();
      
      result = {
        "status":false,
        "message":json.decode(response.body)["error"]["message"]
      };

      return result;
    }
  }
  
  
  Future<Map<String, dynamic>> registerUser(String name, String email, String passWord) async{
    var result;

    final Map<String, String> registrationData = {
      "name":name,  
      "email":email,
      "password":passWord
    };

    __registeredStatus = Status.registering;
    notifyListeners();

    Uri registerUri = Uri.parse(AppConstant.signUp);

    Response response = await http.post(
      registerUri,
      body: json.encode(registrationData),
      headers: {'Content-Type': 'application/json'}
    );

    // print("Done getting the response ");
    // print("${response.statusCode}");

    if(response.statusCode == 200){
      __registeredStatus  = Status.registered;
      notifyListeners();
      
      result = {
        "status":true,
        "message": "Registered Successfully"
      };

      return result;
    
    }
    else{
      print("Gotten to the else statement");
      __registeredStatus = Status.notRegistered;
      notifyListeners();

      result = {
        "status":false,
        "message": json.decode(response.body)["error"]["message"]
      };
      

      return result;
    }
  }
}


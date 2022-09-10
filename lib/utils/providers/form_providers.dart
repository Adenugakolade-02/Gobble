import 'package:flutter/cupertino.dart';

class ValidateForms{
  
  String? email;
  String? password;
  String? name;

  String? validateEmail(String? value){
    if (value!.isEmpty){
      return "Field cannot be empty";
    }else {
      return null;
    }
  }

  String? validatePassWord(String? value){
    if (value!.isEmpty){
      return "Field cannot be empty";
    }
    else if(value.length<6){
      return "Password lenght is less than 6";
    }
    else {
      return null;
    }
  }

  
  String? validateName(String? value){
    if (value!.isEmpty){
      return "Field cannot be empty";
    }else {
      name=value;
      return null;
    }
  }

  
  void login(GlobalKey<FormState> key){
    if (key.currentState?.validate() ?? false){
      key.currentState!.save();
    }
  }



  void saveMail(String? value){
    email = value!;
  }
  void savePass(String? value){
    password = value!;
  }
  void saveName(String? value){
    password = value!;
  }

}
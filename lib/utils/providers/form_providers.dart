import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobble/model/auth_provider.dart';
// import 'package:http/http.dart';
import 'package:provider/provider.dart';

class ValidateForms{
  // final BuildContext context;
  // ValidateForms(this.context);
  
  
  // String? _email;
  // String? _password;
  // String? _name;

  

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
      // _name=value;
      return null;
    }
  }

  
  // dynamic login(GlobalKey<FormState> key, Future<Map<String, dynamic>> successfulMessage){
  //   if (key.currentState?.validate() ?? false){
  //     key.currentState!.save();
  //     // Future<Map<String, dynamic>> successfulMessage = context.select<AuthProvider, Future<Map<String, dynamic>>>((provider) => provider.login(_email!, _password!));
      
  //     successfulMessage.then((response){
  //       if(response['status']){
  //         Navigator.pushReplacementNamed(context, '/homeScreen');
  //       }
  //       else{
  //         Flushbar(
  //           title: "Failed Login",
  //           message: response["message"],
  //           duration: const Duration(seconds: 2),
  //         )..show(context);
  //       }
  //     });
  //   }
  // }

//   dynamic signUp(GlobalKey<FormState> key){
//     if (key.currentState?.validate() ?? false){
//       key.currentState!.save();
//       Future<Map<String, dynamic>> successfulMessage = context.select<AuthProvider, Future<Map<String, dynamic>>>((provider) => provider.registerUser(_name!,_email!, _password!));
//       successfulMessage.then((response){
//         if(response["Status"]){
//           Flushbar(
//             title: "Success",
//             message: "Registered successfully, kindly proceed to login",
//             duration: const Duration(seconds: 2),
//           )..show(context);
//           Navigator.pushReplacementNamed(context, '/login');
//         }else{
//           Flushbar(
//             title: "Failed Registration",
//             message: response["message"],
//             duration: const Duration(seconds: 2),
//           )..show(context);
//         }
//       });
//     }
//   }


//   void saveMail(String? value){
//     _email = value!;
//   }
//   void savePass(String? value){
//     _password = value!;
//   }
//   void saveName(String? value){
//     _name = value!;
//   }

}
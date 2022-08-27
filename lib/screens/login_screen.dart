import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gobble/utils/providers/form_providers.dart';
import 'package:gobble/widgets/forms/basic_form_field.dart';
import 'package:provider/provider.dart';

import '../utils/dimensions.dart';
import '../widgets/onboarding_widgets/onboarding_buttons.dart';

import 'package:gobble/screens/signup_screen.dart';

class LogInForm extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  ValidateForms form = ValidateForms();
  
  // void _login(){
  //   if (_key.currentState?.validate()==true){
  //     _key.currentState!.save();
  //     print(form.name);
  //   }
  // }

  TextStyle textStyle = const TextStyle(
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Color(0xFF7C7C7C));
  TextStyle textStyle1 = const TextStyle(
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: Color(0xFF7C7C7C));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Yo! a fucking form")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getHeight(context, 25)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getHeight(context, 77.25)),
                    const Center(
                        child: Text('Gobble',
                            style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w600,
                                fontSize: 35,
                                color: Color(0xFF53B175)))),
                    SizedBox(height: getHeight(context, 100)),
                    const Text("Login",
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                            fontSize: 26,
                            color: Color(0xFF030303))),
                    SizedBox(height: getHeight(context, 15)),
                    Text("Enter your emails and password", style: textStyle1),
                    SizedBox(height: getHeight(context, 40)),
                    Text(
                      'Email',
                      style: textStyle,
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 10),
                    BasicFormField(validator: (value)=>form.validateEmail(value), saveData: (_)=>form.saveMail(_),),
                    SizedBox(height: getHeight(context, 30)),
                    Text(
                      'Password',
                      style: textStyle,
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 10),
                    BasicFormField(
                        validator: (value)=>form.validatePassWord(value),
                        saveData: (_)=> form.savePass(_),
                        hasIcon: true,
                        suffixIcon: const Icon(
                          Icons.visibility_off,
                          color: Color(0xFF7C7C7C),
                        ),
                        isPassWord: true),
                    SizedBox(height: getHeight(context, 20)),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        child: const Text(
                          'Forgot Password?',
                          // textAlign: TextAlign.end,
                          style: TextStyle(
                              color: Color(0xFF181725),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Gilroy'),
                        ),
                        onPressed: (){},
                      ),
                    ),
                    SizedBox(height: getHeight(context, 20)),
                    SizedBox(height: getHeight(context, 20)),
                    OnBoardingButton('Log In', ()=>form.login(_key)),
                    SizedBox(height: getHeight(context, 20)),
                    Center(
                      child: RichText(
                          text: TextSpan(
                              text: "Don't have an account?",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Gilroy',
                                  color: Color(0xFF030303)),
                              children: [
                            TextSpan(
                                text: ' Sign Up',
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Gilroy',
                                    color: Color(0xFF7EC497)),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupForm()))
                                  )
                          ])),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

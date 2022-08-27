import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gobble/widgets/forms/basic_form_field.dart';
import 'package:gobble/utils/providers/form_providers.dart';
import '../utils/dimensions.dart';
import '../widgets/onboarding_widgets/onboarding_buttons.dart';
import 'login_screen.dart';

class SignupForm extends StatefulWidget {
  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _key = GlobalKey<FormState>();

  ValidateForms form = ValidateForms();
  bool showPassWord = false;


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
                    const Text("Sign Up",
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                            fontSize: 26,
                            color: Color(0xFF030303))),
                    SizedBox(height: getHeight(context, 15)),
                    Text("Create an account with us to enjoy more",
                        style: textStyle1),
                    Text("customers benefits.", style: textStyle1),
                    SizedBox(height: getHeight(context, 40)),
                    Text(
                      'Username',
                      style: textStyle,
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 10),
                    BasicFormField(
                      validator: (_) => form.validateName(_),
                      saveData: (_) => form.saveName(_),
                    ),
                    SizedBox(height: getHeight(context, 30)),
                    Text(
                      'Email',
                      style: textStyle,
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 10),
                    BasicFormField(
                      validator: (_) => form.validateEmail(_),
                      saveData: (_) => form.saveMail(_),
                    ),
                    SizedBox(height: getHeight(context, 30)),
                    Text(
                      'Password',
                      style: textStyle,
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 10),
                    BasicFormField(
                      hasIcon: true,
                      suffixIcon: InkWell(
                          onTap: ()=>setState(() {
                            showPassWord=!showPassWord;
                          }),
                            child: showPassWord? const Icon(
                            Icons.visibility,
                            color: Color(0xFF7C7C7C),
                          ):const Icon(
                            Icons.visibility_off,
                            color: Color(0xFF53B175),
                        )),
                      isPassWord: !showPassWord,
                      validator: (_) => form.validatePassWord(_),
                      saveData: (_) => form.savePass(_),
                    ),
                    SizedBox(height: getHeight(context, 20)),
                    RichText(
                        text: TextSpan(
                            text: 'By continuing you agree to our',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Gilroy',
                                color: Color(0xFF7C7C7C)),
                            children: [
                          const TextSpan(
                              text: ' Terms of Service and Privacy Policy.',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Gilroy',
                                  color: Color(0xFF7EC497)))
                        ])),
                    SizedBox(height: getHeight(context, 20)),
                    OnBoardingButton('Sign Up', () => form.login(_key)),
                    SizedBox(height: getHeight(context, 20)),
                    Center(
                      child: RichText(
                          text: TextSpan(
                              text: 'Already a member?',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Gilroy',
                                  color: Color(0xFF030303)),
                              children: [
                            TextSpan(
                                text: 'Sign In',
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Gilroy',
                                    color: Color(0xFF7EC497)),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LogInForm())))
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

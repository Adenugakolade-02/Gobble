import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gobble/model/auth_provider.dart';
import 'package:gobble/model/user_preference.dart';
import 'package:gobble/utils/providers/form_providers.dart';
import 'package:gobble/widgets/forms/basic_form_field.dart';
import 'package:provider/provider.dart';

import '../utils/dimensions.dart';
import '../widgets/onboarding_widgets/onboarding_buttons.dart';

import 'package:gobble/screens/signup_screen.dart';

class LogInForm extends StatefulWidget {
  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _key = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String? message;

  bool showPassWord = false;
  
  ValidateForms form = ValidateForms();
  
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

  var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const[
        CircularProgressIndicator(),
        SizedBox(width:10),
        Text(" Authenticating ... Please wait")
      ],
    );

  void login(){
    if (_key.currentState?.validate() ?? false){
      Future<Map<String, dynamic>> successfulMessage = context.read<AuthProvider>().login(email.text, password.text);
      // context.select<AuthProvider, Future<Map<String, dynamic>>>((provider) => provider.login(email.text, password.text));
      successfulMessage.then((response){
        if(response['status']){
          Navigator.pushReplacementNamed(context, '/homeScreen');
        }
        else{
          Flushbar(
            title: "Failed Login",
            message: response["message"],
            duration: const Duration(seconds: 2),
          )..show(context);
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    // message = await UserPreference().getToken1();
    jfj();
    super.initState();
  }

  void jfj() async{
    message = await UserPreference().getToken();
  }


  @override
  Widget build(BuildContext context) {
    Status status = context.select<AuthProvider, Status>((provider) => provider.loggedInStatus);
    return Scaffold(
      
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
                    Text("here is the token ${message}"),
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
                    
                    BasicFormField(controller: email,validator: (value)=>form.validateEmail(value),),
                    
                    SizedBox(height: getHeight(context, 30)),
                    
                    Text(
                      'Password',
                      style: textStyle,
                      textAlign: TextAlign.right,
                    ),
                    
                    const SizedBox(height: 10),
                    
                    BasicFormField(
                      controller: password,
                        validator: (value)=>form.validatePassWord(value),
                        // saveData: (_)=> form.savePass(_),
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
                        isPassWord: !showPassWord),
                    
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
                    
                    status == Status.notLoggedIn ? 
                    OnBoardingButton('Log In', ()async{login();} ): 
                    loading,
                    
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

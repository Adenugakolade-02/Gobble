  import 'package:flutter/material.dart';
import 'package:gobble/model/auth_provider.dart';
import 'package:gobble/model/cart.dart';
import 'package:gobble/model/products_provider.dart';
import 'package:gobble/model/user.dart';
import 'package:gobble/model/user_preference.dart';
import 'package:gobble/screens/home_screen.dart';
import 'package:gobble/screens/onboarding_screen.dart';
import 'package:gobble/screens/product_detail_screen.dart';
import 'package:gobble/screens/signup_screen.dart';
import 'package:gobble/screens/login_screen.dart';
import 'package:gobble/utils/providers/form_providers.dart';
import 'package:provider/provider.dart';

void main() {
  
  runApp(
    const MyApp(),    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget futureWidget(Future<bool?> future){
    return FutureBuilder(
          future: future,
          builder: (context, snapshot){
            switch (snapshot.connectionState){
              case ConnectionState.none:
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              default:
                if(snapshot.data == null || snapshot.data==false){
                  return LogInForm();
                }
                else{
                  return HomeScreen();
                }
            }
          });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductsProvider>(create: (_)=> ProductsProvider()),
        ChangeNotifierProvider<Cart>(create: (_)=> Cart()),
        ChangeNotifierProvider<AuthProvider>(create: (_)=> AuthProvider()),
        
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
          primarySwatch: Colors.blue,
          inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(fontFamily: 'Gilroy',fontWeight: FontWeight.w600,fontSize:16),
    )
        ),
        
        home: futureWidget(UserPreference().isLoggedIn()),
        
        // status==Status.loggedIn ? HomeScreen() : LogInForm(),
        
        routes: {
          '/homeScreen':(context)=> HomeScreen(),
          '/login':(context)=> LogInForm(),
          '/signUp':(context)=> SignupForm(),
          '/myapp':(context)=> const MyApp()
        },
    ),
      
      );
    
  }
}

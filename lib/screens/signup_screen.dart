import 'package:flutter/material.dart';
import 'package:gobble/widgets/forms/basic_form_field.dart';

class SignupForm extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yo! a fucking form")),
      body: Center(
        child: Form(
          key: _key,
          child: Column(
            children: [
              BasicFormField(labelText: "Username", hasIcon: false, suffixIcon: null, isPassWord: false)
            ],
          )),
      ),
    );
  }
}
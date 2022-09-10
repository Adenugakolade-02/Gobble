import 'package:flutter/material.dart';
import '../../utils/dimensions.dart';

class BasicFormField extends StatelessWidget {
  // String? Function(String?) validator;
  dynamic suffixIcon;
  final bool hasIcon;
  final bool isPassWord;
  final String? Function(String?) validator;
  final Function(String?) saveData;

  BasicFormField({this.hasIcon=false, this.suffixIcon=null, this.isPassWord=false, required this.validator, required this.saveData});

  FocusNode focusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
    suffixIcon: hasIcon? suffixIcon: null,
    border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
    contentPadding: const EdgeInsets.only(bottom:10.55, top:10),
    focusColor: const Color(0xFF7C7C7C),
    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFE2E2E2)))
        ),
        style: const TextStyle(fontFamily: 'Gilroy',fontWeight: FontWeight.w500,fontSize:18),
        obscureText: isPassWord,
        validator: validator,
        onSaved: saveData,
        // validator: validator,
      );
  }
}
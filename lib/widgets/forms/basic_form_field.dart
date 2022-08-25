import 'package:flutter/material.dart';
import '../../utils/dimensions.dart';

class BasicFormField extends StatelessWidget {
  final String labelText;
  // String? Function(String?) validator;
  dynamic suffixIcon;
  bool hasIcon=false;
  bool isPassWord = false;

  BasicFormField({required this.labelText, required this.hasIcon, required this.suffixIcon, required this.isPassWord});

  FocusNode focusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
    // isCollapsed: false,
    suffixIcon: hasIcon? suffixIcon: null,
    labelText: labelText,
    labelStyle: focusNode.hasFocus? TextStyle(fontFamily: 'Gilroy',fontWeight: FontWeight.w600,fontSize:16):TextStyle(fontFamily: 'Gilroy',fontWeight: FontWeight.w600,fontSize:16),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
    contentPadding: const EdgeInsets.only(bottom:10.55, top:20),
    focusColor: const Color(0xFF7C7C7C),
    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF7C7C7C)))
        ),
        style: const TextStyle(fontFamily: 'Gilroy',fontWeight: FontWeight.w500,fontSize:18),
        obscureText: isPassWord,
        // validator: validator,
      );
  }
}
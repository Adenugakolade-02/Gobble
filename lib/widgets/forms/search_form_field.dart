import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final bool icon;
  final TextEditingController? controller;

  const SearchField({Key? key,this.icon=true, this.controller=null}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
    decoration: InputDecoration(
      filled: true,
    fillColor: const Color(0xFFF2F3F2),
    prefixIcon: icon==true? const Icon(Icons.search, color: Color(0xFF030303),): null,
    border: InputBorder.none,
    contentPadding: const EdgeInsets.only(bottom:10.55, top:10, right: 5, left: 5),
    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFF2F3F2)))
    ),
    style: const TextStyle(fontFamily: 'Gilroy',fontWeight: FontWeight.w500,fontSize:18),
    controller: controller,
    maxLines: !icon? 3 : null,
    );
  }
}
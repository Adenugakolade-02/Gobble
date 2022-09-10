import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final Function(String) function;

  const SearchField({Key? key, required this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
    decoration: const InputDecoration(
      filled: true,
    fillColor: Color(0xFFF2F3F2),
    prefixIcon: Icon(Icons.search, color: Color(0xFF030303),),
    border: InputBorder.none,
    contentPadding: EdgeInsets.only(bottom:10.55, top:10),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFF2F3F2)))
    ),
    style: const TextStyle(fontFamily: 'Gilroy',fontWeight: FontWeight.w500,fontSize:18),
    onFieldSubmitted: function,
    );
  }
}
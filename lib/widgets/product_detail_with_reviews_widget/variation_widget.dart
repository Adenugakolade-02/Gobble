import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';

class VariationWidget extends StatelessWidget {
  final Function() increment;
  final Function() decrement;

  const VariationWidget({Key? key, required this.increment, required this.decrement}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context, 140.67),
      height: getHeight(context, 45.67),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            onPressed: decrement,
            icon: const Icon(Icons.remove, color: Colors.grey,)),
          Container(
            width: getWidth(context, 45.67),
            height: getHeight(context, 45.67),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.black12)
            ),
            child: const Center(child: Text('1',))),
          IconButton(
            onPressed: increment,
            icon: const Icon(Icons.add_outlined, color: Color(0xFF53B175),)),
        ],
      ),
    );
  }
}
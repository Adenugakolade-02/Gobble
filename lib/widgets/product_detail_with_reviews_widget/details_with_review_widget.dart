import 'package:flutter/material.dart';

class DetailsWithReview extends StatefulWidget {
  final bool isDetails;
  final bool isReviews;
  final Function() detailsFunction;
  final Function() reviewsFunction;
  
  DetailsWithReview({Key? key, required this.isDetails, required this.isReviews, required this.detailsFunction, required this.reviewsFunction}) : super(key: key);

  @override
  State<DetailsWithReview> createState() => _DetailsWithReviewState();
}

class _DetailsWithReviewState extends State<DetailsWithReview> {
  final BoxDecoration _selectedDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: const [BoxShadow(color: Colors.black26,blurRadius: 5.0)]);

  final TextStyle _textStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily:'Gilroy');

  final BoxDecoration _unSelectedDecoration = const BoxDecoration();
  final EdgeInsets _margin = const EdgeInsets.only(left:7,top: 3, bottom: 3, right: 7);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color(0xFFF2F3F2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: InkWell(
              onTap: widget.detailsFunction,
                child: Container(
                  margin: _margin,
                  height: 39,
                  child: Center(child: Text('Detail Items', style: _textStyle)),
                  decoration: widget.isDetails ?_selectedDecoration: _unSelectedDecoration,),
            ),
          ),
          
          const VerticalDivider(),
          
          Expanded(
            child: InkWell(
              onTap: widget.reviewsFunction,
                child: Container(
                  margin: _margin,
                  height: 39,
                  child: Center(child: Text('Reviews', style: _textStyle)),
                  decoration: widget.isReviews ? _selectedDecoration: _unSelectedDecoration,),
            ),
          )
        ]
      )
    );
  }
}
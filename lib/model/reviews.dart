import 'dart:convert';

class Reviews{
  final String review;
  final String user;

  Reviews({
    required this.review,
    required this.user
  });
  
  factory Reviews.fromJson(Map<String, dynamic> data){
    return Reviews(
      review: data['review'] ?? '',
      user: data['User']['name'] ?? ''
      );
  }

  Map<String, dynamic> toJson(String review){
    return {"review": review};
  }

  @override
  String toString() {
    // TODO: implement toString
    return  '$user';
    // return super.toString();
  }
}
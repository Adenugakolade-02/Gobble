import 'package:gobble/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserPreference{

  Future<bool> saveUser(User user) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("userId", user.id);
    prefs.setString("name", user.name);
    prefs.setString("email", user.email);
    prefs.setString("token", user.token);
    prefs.setBool("isLoggedIn", true);

    return prefs.commit();
  }

  Future<User> getUser() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name  = prefs.getString("name");
    String? email = prefs.getString("email");
    String? token = prefs.getString("token");
    int? id = prefs.getInt("id");

    return User(id: id!, name:name!, email: email!, token: token!);
  }

  void removeUser() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("name");
    prefs.remove("email");
    prefs.remove("token");
    prefs.remove("id");
    prefs.remove("isLoggedIn");
  }

  Future<String> getToken() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString("token");
    return token!;
  }

  Future<bool?> isLoggedIn() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLoggedIn");
  }

}
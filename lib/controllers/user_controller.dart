import 'dart:convert';

import 'package:app_food/base/show_custom_snackbar.dart';
import 'package:app_food/data/repository/user_repo.dart';
import 'package:app_food/models/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController{
  final UserRepo userRepo;
  UserController({required this.userRepo});
  var user;
  String address="";

  Future<bool> SignUp(data,url) async{
    http.Response response=(await userRepo.SignUp(data, url));
    if(response.statusCode==200){
     print("Register success");
     return true;
    }else{
      print("Failed Register");
      return false;
    }
  }
  Future<bool> LogOut(){
    return userRepo.LogOut();
  }
  getUser() async {
    address="";
    SharedPreferences prefs = await SharedPreferences.getInstance();
   user=await userRepo.getUser();
   address=prefs.getString("address")!;
   update();
  }
  Future<bool> editProfile(data, address)async {
    String? getuser;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool check=await userRepo.editProfile(data, address);
    if(check){
      if(prefs.containsKey("user")){
        getuser=prefs.getString("user");
        user=User.fromJson(jsonDecode(getuser!));
        user.name=data['name'];
        user.email=data['email'];
        user.phone=data['phoneNumber'];
        String userStorage=jsonEncode(user);
        prefs.setString("user", userStorage);
        prefs.setString("address",address['address']);
         getUser();
        return true;
      }
    }else{
      return false;
    }
    return false;
  }
  Future<bool> SignIn(data,url) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    http.Response response=(await userRepo.SignIn(data, url));
    if(response.statusCode==200){
      user=User.fromJson(jsonDecode(response.body));
      String userStorage=jsonEncode(user);
      prefs.setString("user", userStorage);
      var checkRole=user.getRoles!.contains("User");
      if(checkRole==true){
        return true;
      }else {
        return false;
      }
    }else{
      showCustomSnackBar("Login Failed",title: "Login");
      return false;
    }
  }

}
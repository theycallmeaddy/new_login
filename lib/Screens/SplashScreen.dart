import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_login/Screens/HomeForm.dart';
import 'package:new_login/Screens/LoginForm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

String finalEmail='k';
class SplashScreen extends StatefulWidget {


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  Future getValidationData() async{
      final SharedPreferences sp = await SharedPreferences.getInstance();
      var userEmail = sp.getString("email");


      if(userEmail==null)
        {
          print("SHAREDPREF");
          finalEmail='no';
          print(finalEmail);
        }
      else{
        setState((){
          finalEmail = userEmail!;
        });
      }

  }

  _navigatetohome() async{
    getValidationData().whenComplete(() async{
      await Future.delayed(Duration(milliseconds: 2000),(){});
      if(finalEmail=='no'){
        Navigator.pushReplacement(this.context,
                MaterialPageRoute(builder: (_)=>LoginForm()));
      }
      else{
        print(finalEmail);
        Navigator.pushReplacement(this.context,
                MaterialPageRoute(builder: (_)=>HomeForm()));
      }
    });
    
    // await Future.delayed(Duration(milliseconds: 1500),(){});
    // Navigator.pushReplacement(this.context,
    //     MaterialPageRoute(builder: (_)=>LoginForm()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(150.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/newww.png'
             ),
            ),
         ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_controller/google_maps_controller.dart';


import '../DatabaseHandler/DbHelper.dart';
import 'LoginForm.dart';
class HomeForm extends StatefulWidget {

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {


  Set<Marker> _markers = {};
  void _onMapCreated(GoogleMapController controller){
    setState(() {
      _markers.add(
          Marker(markerId: MarkerId(userId),
              position: LatLng(double.parse(lat),double.parse(lon)),
          infoWindow: InfoWindow(
            title: userName,
            snippet: userId
          )));
    });
  }



  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  String userName='',userId='',userEmail='';
  late String lat,lon;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    final SharedPreferences sp = await _pref;
    setState(() {
      userName = sp.getString("user_name")!;
      userId = sp.getString("user_id")!;
      userEmail = sp.getString("email")!;
      lat = sp.getString("lat")!;
      lon = sp.getString("lon")!;
    });
  }

  logout() async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('email');
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => LoginForm()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Column(
            children: [
              Container(

                height: 300.0,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 300),
                        child: TextButton(
                          child: Text(
                            'LogOut',
                            style: TextStyle(color: Colors.indigo.shade900),
                          ),
                          onPressed: logout,
                        ),
                      ),

                      Text(
                      'Welcome $userName',
                          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0)
                    ),
                      SizedBox(height: 20.0),

                      Container(
                        width: 120,
                        height: 120,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset("assets/images/userr.png",
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'USER ID: $userId',


                      ),
                      Text(
                        'NAME: $userName',

                      ),
                      Text(
                        'EMAIL: $userEmail',

                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                height: 280.0,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  markers: _markers,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(double.parse(lat),double.parse(lon)),
                    zoom: 11,
                  ),)
              )
            ],
          ),
        ),
      ),
    );
  }
}

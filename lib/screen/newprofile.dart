import 'package:flutter/material.dart';
import 'package:tws/apiService/AppConstant.dart';
import 'package:tws/apiService/apiResponse/ResponseFetchClients.dart';
import 'package:tws/apiService/sharedprefrence.dart';
import 'package:tws/fragment/diettab.dart';
import 'package:tws/fragment/newprifletab.dart';
import 'package:tws/fragment/workouttab.dart';

class NewProfile extends StatefulWidget {

  DataFetchClients data;
  NewProfile({this.data});

  @override
  State<NewProfile> createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {

  var name ;

  void referCode() async{
    name = await SharedPrefManager.getPrefrenceString(AppConstant.TRAINERNAME);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {

        referCode();

      });
    });
    referCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0XFF2CB3BF),
            bottom: TabBar(
              tabs: [
                Tab(text: "Profile",),
                Tab(text: "Diet"),
                Tab(text: "Workout",),
                Tab(text: "Gallery",),
              ],
            ),
            title: Text(name.toString()),
          ),
          body: TabBarView(
            children: [
              NewProfileTab(widget.data),
              DietTab(),
              WorkoutTab(),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}


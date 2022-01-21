import 'package:flutter/material.dart';
import 'package:tws/fragment/createnewdiet.dart';
import 'package:tws/fragment/createnewworkout.dart';
import 'package:tws/fragment/reviewcleintworkout.dart';

class WorkoutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNewWorkOut()));
            },
            child: Stack(
              children: [
                Container(
                  height: 160,
                  margin: EdgeInsets.all(13),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset("assets/images/spalsh.jpg",width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
                  ),
                ),

                Positioned(
                    right: 15,
                    top: 0,
                    bottom: 0,
                    child: Icon(Icons.arrow_forward_ios_rounded,size: 35,color: Colors.white,)),

                Positioned(
                    left: 25,
                    top: 0,
                    bottom: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Icon(Icons.border_top,color: Colors.white,size: 38,),

                        Container(
                          width: 90,
                          height: 2,
                          margin: EdgeInsets.only(bottom: 3),
                          color: Colors.white,
                        ),

                        Text("Create New Workout",
                          style: TextStyle(
                              fontSize: 16*MediaQuery.of(context).textScaleFactor,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          ),)

                      ],
                    )),
              ],
            ),
          ),

          Stack(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReviewClientWorkOut()));
                },
                child: Container(
                  height: 160,
                  margin: EdgeInsets.all(13),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset("assets/images/spalsh.jpg",width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
                  ),
                ),
              ),

              Positioned(
                  right: 15,
                  top: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReviewClientWorkOut()));
                    },
                      child: Icon(Icons.arrow_forward_ios_rounded,size: 35,color: Colors.white,))),

              Positioned(
                  left: 25,
                  top: 0,
                  bottom: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Icon(Icons.border_top,color: Colors.white,size: 38,),

                      Container(
                        width: 90,
                        height: 2,
                        margin: EdgeInsets.only(bottom: 3),
                        color: Colors.white,
                      ),

                      Text("Review Client Workout",
                        style: TextStyle(
                            fontSize: 16*MediaQuery.of(context).textScaleFactor,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),),

                    ],
                  ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'addnewexercise.dart';

class BlankExerCise extends StatefulWidget {
  @override
  _BlankExerCiseState createState() => _BlankExerCiseState();
}

class _BlankExerCiseState extends State<BlankExerCise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset("assets/images/spalsh.jpg",fit: BoxFit.cover,
            width: 50,height: 50,),
          ),

          SizedBox(
            height: 20,
          ),

          Text("No exercise have been added yet",
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF262626),
            fontWeight: FontWeight.normal
          ),),

          SizedBox(height: 30,),

          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNewExerCise()));
            },
            child: Container(
              margin: EdgeInsets.only(left: 100,right: 100),
              padding: EdgeInsets.only(left: 22,right: 22,top: 14,bottom: 14),
              child: Center(
                child: Text("ADD EXERCISE",style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.black,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
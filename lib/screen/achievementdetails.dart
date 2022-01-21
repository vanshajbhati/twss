import 'package:flutter/material.dart';

class AchievementDetails extends StatefulWidget {
  @override
  _AchievementDetailsState createState() => _AchievementDetailsState();
}

class _AchievementDetailsState extends State<AchievementDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0XFF2CB3BF),
        title: Text("Achievement Details", style: TextStyle(color: Colors.white,
        fontSize: 20),),
        leading: Icon(Icons.arrow_back, color: Colors.white,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top:20,bottom: 20,right: 20,left: 20),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(22), topLeft: Radius.circular(22))
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.only(left: 50,right: 50),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset("assets/images/spalsh.jpg",fit: BoxFit.cover,height: 160,width: 150,),),
                    ),
                  ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 30,top: 16),
                child: Text("Athlete", style: TextStyle(
                    fontSize: 19 * MediaQuery
                        .of(context)
                        .textScaleFactor,
                    fontWeight: FontWeight.w600,
                    color: Color(0XFF2CB3BF)
                ),),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 30,top: 2),
                child: Text("Mr. delhi", style: TextStyle(
                    fontSize: 16 * MediaQuery
                        .of(context)
                        .textScaleFactor,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey
                ),),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 30,top: 16),
                child: Text("Description", style: TextStyle(
                    fontSize: 17 * MediaQuery
                        .of(context)
                        .textScaleFactor,
                    fontWeight: FontWeight.w600,
                    color: Color(0XFF636363),
                ),),
              ),

              Container(
                margin: const EdgeInsets.only(left: 30,right: 30),
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Color(0XFFA4A4A4),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 15),
                child: Text("Lorem ipsum dolor sit amet, consctor asipdj adj deud ueiwd ajds daiojd aid ajd hello junk jkk kj kjjk gf fdvf",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0XFF9E9E9E)
                ),),
              ),

              Container(
                height: MediaQuery.of(context).size.height,
              )
            ],
          ),
        ),
      ),
    );
  }
}
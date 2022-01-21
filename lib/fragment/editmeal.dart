import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tws/apiService/apimanager.dart';

class EditMeal extends StatefulWidget {

  final String maelName,mealTime,id,note;
  EditMeal({this.maelName,this.mealTime,this.id,this.note});

  @override
  State<EditMeal> createState() => _EditMealState();
}

class _EditMealState extends State<EditMeal> {

  bool _isLoad = false;

  void _trySubmit()async{
      setState(() {
        _isLoad = true;
      });
      await Provider.of<ApiManager>(context,listen: false).editMealApi(mealController.text, timeController.text,widget.id);
      setState(() {
        _isLoad = false;
      });

  }

  TextEditingController mealController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  @override
  void initState() {
    mealController.text = widget.maelName;
    timeController.text = widget.mealTime;
    noteController.text = widget.note;
    super.initState();
  }

  @override
  void dispose() {
    mealController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 0,
        leading: Icon(Icons.arrow_back),
      backgroundColor: Color(0xFFFFFFFF),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Edit Meal",style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w600
                ),),
              ),

              TextFormField(
                controller: mealController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        fontSize: 14*MediaQuery.of(context).textScaleFactor,
                        color: Color(0XFF2CB3BF)),
                    labelText: "Meal name, Eg. Breakfast,Evening Snacks, etc",
                    labelStyle: TextStyle(
                        color: Color(0XFF2CB3BF),
                      fontSize: 14
                    ),
                    // hintText: "Name/Business Name",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF363434)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF363434)),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF363434)),
                    ),
                  )
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: timeController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        fontSize: 14*MediaQuery.of(context).textScaleFactor,
                        color: Color(0XFF2CB3BF)),
                    labelText: "Time",
                    labelStyle: TextStyle(
                        color: Color(0XFF2CB3BF),
                        fontSize: 14
                    ),
                    // hintText: "Name/Business Name",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF363434)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF363434)),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF363434)),
                    ),
                  )
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: noteController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        fontSize: 14*MediaQuery.of(context).textScaleFactor,
                        color: Color(0XFF2CB3BF)),
                    labelText: "Note (Optional)",
                    labelStyle: TextStyle(
                        color: Color(0XFF2CB3BF),
                        fontSize: 14
                    ),
                    // hintText: "Name/Business Name",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF363434)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF363434)),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF363434)),
                    ),
                  )
              ),

              SizedBox(height: 35,),

              if(_isLoad)
                CircularProgressIndicator()
              else
              GestureDetector(
                onTap: _trySubmit,
                child: Container(
                  width: MediaQuery.of(context).size.width*0.38,
                  height: 40,
                  child: Center(
                    child: Text("SUBMIT",style: TextStyle(
                        fontSize: 19*MediaQuery.of(context).textScaleFactor,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    ),),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0XFF299FAB),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tws/apiService/apimanager.dart';

class CreateMeal extends StatefulWidget {

  final String id;
  CreateMeal({this.id});

  @override
  State<CreateMeal> createState() => _CreateMealState();
}

class _CreateMealState extends State<CreateMeal> {

  TextEditingController nameController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  bool _isLoad = false;

  void _trySubmit()async{
    if(nameController.text.isEmpty){
      Fluttertoast.showToast(msg: "Enter meal name",
          gravity: ToastGravity.BOTTOM);
    }else if(timeController.text.isEmpty){
      Fluttertoast.showToast(msg: "Enter time",
          gravity: ToastGravity.BOTTOM);
    }else{
      setState(() {
        _isLoad = true;
      });
      await Provider.of<ApiManager>(context,listen: false).createMealApi(nameController.text, timeController.text,noteController.text,widget.id);
      setState(() {
        _isLoad = false;
      });
    }
  }

  @override
  void dispose() {
    noteController.dispose();
    nameController.dispose();
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
                child: Text("Create Meal",style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                ),),
              ),

              TextFormField(
                controller: nameController,
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
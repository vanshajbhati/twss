import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tws/apiService/AppConstant.dart';
import 'package:tws/apiService/apimanager.dart';
import 'package:provider/provider.dart';
import 'package:tws/apiService/sharedprefrence.dart';
import 'package:tws/screen/homescreen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  var selectedValue = "";
  final _formKey = GlobalKey<FormState>();

  var _userName="",_email = "";
  TextEditingController userNumber = new TextEditingController();
  bool _isLoad = false;

  void _trySubmit() async{
    final isValid =_formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if(isValid) {
      _formKey.currentState.save();
      setState(() {
        _isLoad = true;});
      await Provider.of<ApiManager>(context,listen: false).registerApi(_email, _userName);
      setState(() {
        _isLoad = false;
      });
    }
  }

  void number() async{
    var phone = await SharedPrefManager.getPrefrenceString(AppConstant.NUMBER);
    userNumber.text = phone;
  }

  @override
  void initState() {
    number();
    super.initState();
  }

  @override
  void dispose() {
    userNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(child: Container(
              color: Colors.black,)),
            Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [

                      SizedBox(height: 10,),

                      CircleAvatar(
                        radius: 43,
                        backgroundColor: Color(0XFF3996B0),
                      backgroundImage: AssetImage("assets/images/spalsh.jpg"),),

                      SizedBox(height: 20,),

                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: Text.rich(
                                TextSpan(
                                    text: 'One step away from registering with  ',
                                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white),
                                    children: <InlineSpan>[
                                      TextSpan(
                                        text: 'THE GYM',
                                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,
                                        color: Color(0XFF3996B0)),
                                      ),
                                    ],
                                ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left:20.0,right: 20),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              style: TextStyle(
                                color: Colors.white
                              ),
                                validator: (value){
                                  if(value.isEmpty){
                                    return 'Please enter name';
                                  }
                                  return null;},
                                onSaved: (value){
                                  _userName = value;
                                },
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                    fontSize: 17*MediaQuery.of(context).textScaleFactor,
                                    color: Colors.white),
                                  labelText: "Name/Business Name",
                                  labelStyle: TextStyle(
                                      color: Colors.white
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
                              enabled: false,
                              controller: userNumber,
                                validator: (value){
                                  if(value.isEmpty){
                                    return 'Please enter mobile number';
                                  }else if(value.length<10){
                                    return 'Please input valid mobile number';
                                  }
                                  return null;},
                                style: TextStyle(
                                  color: Colors.white
                                ),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 17*MediaQuery.of(context).textScaleFactor,
                                      color: Colors.white
                                  ),
                                  labelText: "Mobile",

                                  labelStyle: TextStyle(
                                      color: Colors.white
                                  ),
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
                            SizedBox(height: 20,),
                            TextFormField(
                                style: TextStyle(
                                    color: Colors.white
                                ),
                                validator: (value){
                                  if(value.isEmpty){
                                    return 'Please enter email';
                                  }return null;},
                                onSaved: (value){
                                  _email = value;
                                },
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 17*MediaQuery.of(context).textScaleFactor,
                                      color: Colors.white
                                  ),
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                      color: Colors.white
                                  ),
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
                            SizedBox(height: 20,),
                          ],
                        ),),

                      SizedBox(height: 40,),

                      if(_isLoad)
                        CircularProgressIndicator()
                      else
                      GestureDetector(
                        onTap: _trySubmit,
                        child: Container(
                          margin: EdgeInsets.only(top: 0,bottom: 10,left: 15,right: 15),
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          child: Center(
                            child: Text("Continue",style: TextStyle(
                                fontSize: 21*MediaQuery.of(context).textScaleFactor,
                                color: Colors.white,
                                fontWeight: FontWeight.w600
                            ),),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0XFF299FAB),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
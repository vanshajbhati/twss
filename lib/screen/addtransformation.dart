import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:tws/apiService/apiResponse/ResponseFetchCertificateType.dart';
import 'package:tws/screen/certificatelist.dart';
import 'package:provider/provider.dart';
import 'package:tws/apiService/apimanager.dart';
import 'package:tws/screen/transformationlist.dart';

class AddTransformation extends StatefulWidget {
  @override
  _AddTransformationState createState() => _AddTransformationState();
}

class _AddTransformationState extends State<AddTransformation> {
  List<Data> data = [];
  File filename;
  File newFile;
  PlatformFile file;
  TextEditingController descriptionController = TextEditingController();
  bool _isLoad = false;



  void _trySubmit()async{
    setState(() {
      _isLoad = true;
    });
    // await Provider.of<ApiManager>(context,listen: false).newCertificateApi(filename, "static Organisation", descriptionController.text);

    await Provider.of<ApiManager>(context,listen: false).addTransformationApi(filename,descriptionController.text);

    setState(() {
      _isLoad = false;
    });
  }

  void onFileOpen() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg','png'],);
    if(result != null) {
      file = result.files.first;
      filename = File(file.path);

      // Provider.of<ApiManager>(context,listen: false).newSendMessageApi("msgBy", widget.sendToId, _enteredMessage,filename);

      setState(() {
        newFile = filename;
      });
    }
  }

  Future<String> getOrganisation() async {
    var future = await Provider.of<ApiManager>(context,listen: false).fetchOrganizationApi();
    setState(() {
      data = future.data;
    });
  }

  List<Data> data1 = [];


  var selectedValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0XFF2CB3BF),
        title: Text("Transformation", style: TextStyle(color: Colors.white),),
        leading: Icon(Icons.arrow_back, color: Colors.white,
        ),
        actions: [
          GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransformationList()));
              },
              child: Icon(Icons.double_arrow,size: 33,))
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20),
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
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text("Add Transformation", style: TextStyle(
                    fontSize: 19 * MediaQuery
                        .of(context)
                        .textScaleFactor,
                    fontWeight: FontWeight.w600,
                    color: Color(0XFF2CB3BF)
                ),),

                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 8),
                      height: 48,
                      color: Color(0XFFF2F2F2),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(file == null ? "upload image here":file.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0XFF7B7B7B)
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        right: 29,
                        top: 7,
                        child: Center(
                          child: RaisedButton(
                              onPressed: () => onFileOpen(),
                              color: Color(0XFF2CB3BF),
                              child: Text("Upload", style: TextStyle(
                                  color: Colors.white
                              ),)
                          ),
                        )),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 12),
                  child: Text("Description", style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: descriptionController,
                    minLines: 1,
                    maxLines: 4,
                    autovalidateMode: AutovalidateMode.always,
                    style: TextStyle(color: Color(0XFF262626)),
                    decoration: InputDecoration(fillColor: Color(0XFFF2F2F2),
                      filled: true,
                      border: InputBorder.none,
                      hintText: "Add description here",
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    ),
                    // decoration: const InputDecoration(
                    //   hintText: 'Bio',
                    //   labelText: 'Bio',
                    //
                    // ),
                    onSaved: (String value) {
                    },
                  ),
                ),

                if(_isLoad)
                  Center(child: CircularProgressIndicator())
                else
                  GestureDetector(
                    onTap: _trySubmit,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 40, bottom: 10, left: 10, right: 10),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 45,
                      child: Center(
                        child: Text("SUBMIT", style: TextStyle(
                            fontSize: 21 * MediaQuery
                                .of(context)
                                .textScaleFactor,
                            color: Colors.white,
                            fontWeight: FontWeight.normal
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
    );
  }
}
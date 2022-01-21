import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tws/apiService/apiResponse/ResponseFetchMembership.dart';
import 'package:tws/apiService/apiResponse/ResponsePlans.dart';
import 'package:tws/apiService/apimanager.dart';
import 'package:tws/screen/editmembershippackage.dart';

class MemberShipPackage extends StatefulWidget {
  @override
  _MemberShipPackageState createState() => _MemberShipPackageState();
}

class _MemberShipPackageState extends State<MemberShipPackage> {

  List<Data> data1 = [];
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool _isLoads = false;

  void deletePackageApi(String id) async {
    setState(() {
      _isLoads = true;
    });
    await Provider.of<ApiManager>(context, listen: false).removePackageApi(id);
    setState(() {
      _isLoads = false;
    });
  }


  Future<String> fetchPlans() async {
    var future = await Provider.of<ApiManager>(context, listen: false).fetchPlansApi();
    setState(() {
      data1 = future.data;
    });
  }

  var selectedValue;

  bool _isLoad = false;

  void _trySubmit() async {
    if (nameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter package name",
          gravity: ToastGravity.BOTTOM);
    } else if (selectedValue == null) {
      Fluttertoast.showToast(msg: "Select duration",
          gravity: ToastGravity.BOTTOM);
    } else if (priceController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Enter price",
          gravity: ToastGravity.BOTTOM);
    } else {
      setState(() {
        _isLoad = true;
      });
      await Provider.of<ApiManager>(context, listen: false)
          .addMemberShipPackageApi(
          selectedValue, priceController.text, nameController.text);
      setState(() {
        _isLoad = false;
      });
      priceController.clear();
      nameController.clear();
    }
  }


  final List<String> names = <String>[];

  @override
  void initState() {
    super.initState();
    this.fetchPlans();
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.white,),
        backgroundColor: Color(0XFF2CB3BF),
        centerTitle: true,
        title: Text("Membership Package", style: TextStyle(
            fontSize: 20 * MediaQuery
                .of(context)
                .textScaleFactor,
            color: Colors.white
        ),),
      ),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 20),
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
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              children: <Widget>[

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Name of Package", style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  ),),
                ),

                SizedBox(height: 10,),

                TextFormField(
                  controller: nameController,
                  autovalidateMode: AutovalidateMode.always,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Color(0XFF262626)),
                  decoration: InputDecoration(
                    fillColor: Color(0XFFF2F2F2), filled: true,
                    border: InputBorder.none,
                    hintText: "Enter package name",
                  ),
                  onSaved: (String value) {},),

                SizedBox(height: 10,),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Duration", style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  ),),
                ),

                if(data1 == null)
                  Text("")
                else
                  Container(
                  color: Color(0XFFF2F2F2),
                  padding: EdgeInsets.only(left: 8, right: 8,),
                  margin: EdgeInsets.only(top: 10),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedValue,
                    hint: Text("Select month"),
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                    underline: Container(
                      height: 2,
                      color: Colors.transparent,),
                    onChanged: (String data) {
                      setState(() {
                        selectedValue = data;
                      });
                    },
                    items: data1.map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value.name,
                        child: Text(value.name),
                      );
                    }).toList(),
                  ),
                ),

                SizedBox(height: 10,),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Price", style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  ),),
                ),

                SizedBox(height: 10,),

                TextFormField(
                  controller: priceController,
                  autovalidateMode: AutovalidateMode.always,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Color(0XFF262626)),
                  decoration: InputDecoration(
                    fillColor: Color(0XFFF2F2F2), filled: true,
                    border: InputBorder.none,
                    hintText: "Enter price",
                  ),
                  onSaved: (String value) {},),

                if(_isLoad)
                  CircularProgressIndicator()
                else
                  GestureDetector(
                    onTap: _trySubmit,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 20, bottom: 10,),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 45,
                      child: Center(
                        child: Text("Add", style: TextStyle(
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

                FutureBuilder(
                    future: Provider.of<ApiManager>(context).fetchMemberShipPackage(),
                    builder: (context, snapshots) {
                      if (snapshots.connectionState == ConnectionState.none)
                        return Center(
                          child: CircularProgressIndicator(),);
                      else if (snapshots.hasError) {
                        return Text("${snapshots.error}");
                      }
                      else {
                        if (snapshots.hasData) {
                          ResponseFetchMembership response = snapshots.data;
                          List<DataMembership> data = response.data;
                          return ListView.builder(
                              itemCount: data.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(top: 10, bottom: 6),
                                  padding: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0XFF2CB3BF))
                                  ),
                                  child: Stack(
                                    children: [
                                      ListTile(
                                        /*leading: Container(
                                          width: 20,
                                          height: 20,
                                          child: Image.asset(
                                            "assets/images/dumbell.png",
                                            width: 17, height: 17,)),*/
                                        title: Text(
                                          data[index].name, style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),),

                                        subtitle: Text(
                                          data[index].plan, style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),),
                                      ),

                                      Positioned(
                                          right: 6,
                                          top: 0,
                                          bottom: 0,
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(builder: (context) =>
                                                          MemberShipPackageEdit(
                                                              month: data[index].plan,
                                                              price: data[index].price,
                                                              id: data[index].id)));
                                                  },
                                                child: Image.asset(
                                                  "assets/images/edits.png",
                                                  width: 22, height: 22,),
                                              ),
                                              SizedBox(width: 16,),
                                              if(_isLoads)
                                                CircularProgressIndicator()
                                              else
                                                GestureDetector(
                                                onTap: () {
                                                  deletePackageApi(data[index].id);
                                                },
                                                child: Image.asset(
                                                  "assets/images/delets.png",
                                                  width: 22, height: 22,),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                );
                              });
                        } else {
                          return Center(child: Text("No package added yet",
                            style: TextStyle(
                                fontFamily: "Proxima Nova",
                                fontWeight: FontWeight.w600,
                                fontSize: 20 * MediaQuery
                                    .of(context)
                                    .textScaleFactor
                            ),),);
                        }
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
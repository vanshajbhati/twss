import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tws/apiService/apiResponse/responsefetchtransformation.dart';
import 'package:tws/apiService/apimanager.dart';
import 'package:tws/screen/achievementdetails.dart';
import 'package:tws/screen/editcertificate.dart';

import '../tranformationimage.dart';

class TransformationList extends StatefulWidget {
  @override
  _TransformationListState createState() => _TransformationListState();
}

class _TransformationListState extends State<TransformationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0XFF2CB3BF),
        title: Text("Transformation", style: TextStyle(color: Colors.white),),
        leading: Icon(Icons.arrow_back, color: Colors.white,),),
      body: FutureBuilder(
        future: Provider.of<ApiManager>(context).fetchTransformationApi(),
        builder: (context,snapshots){
          if(snapshots.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),);
          else if (snapshots.hasError) {
            return Text("${snapshots.error}");}
          else{
            if(snapshots.hasData){
              ResponseFetchTransformation response = snapshots.data;
              List<Data> data = response.data;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransformationImage(image:"http://fitnessapp.frantic.in/"+data[index].image.toString())));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          elevation: 10,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network("http://fitnessapp.frantic.in/"+data[index].image,width: 110,height: 110,fit: BoxFit.cover,),),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: ()async{
                                          setState(() {
                                            Provider.of<ApiManager>(context,listen: false).deleteCertificateApi(data[index].id.toString());
                                          });
                                        },
                                        child: Visibility(
                                          visible: false,
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding: const EdgeInsets.all(12.0),
                                                child: Icon(Icons.delete,size: 30,),
                                              )),
                                        ),
                                      ),
                                      SizedBox(height: 7,),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(data[index].description,
                                          style: TextStyle(
                                              fontSize: 14*MediaQuery.of(context).textScaleFactor,
                                              fontWeight: FontWeight.normal),),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }else{
              return Center(child: Text("No transformation added",
                style: TextStyle(
                    fontFamily: "Proxima Nova",
                    fontWeight: FontWeight.w600,
                    fontSize: 20*MediaQuery.of(context).textScaleFactor
                ),),);
            }
          }
        },
      ),
    );
  }
}
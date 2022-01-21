import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:tws/apiService/AppConstant.dart';
import 'package:tws/apiService/apiResponse/ResponseFetchClients.dart';
import 'package:tws/apiService/apimanager.dart';
import 'package:tws/apiService/sharedprefrence.dart';
import 'package:tws/chat/newChatScreen.dart';
import 'package:tws/screen/newprofile.dart';

class MyClient extends StatefulWidget {
  @override
  _MyClientState createState() => _MyClientState();
}

class _MyClientState extends State<MyClient> {

  @override
  void initState() {
    Provider.of<ApiManager>(context,listen: false).fetchProfileApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0XFF2CB3BF),
        // centerTitle: true,

        title: Text("Clients",style: TextStyle(
          fontSize: 22*MediaQuery.of(context).textScaleFactor,
          color: Colors.white
        ),),
      ),
      body: FutureBuilder(
        future: Provider.of<ApiManager>(context).fetchClientsApi(),
        builder: (context,snapshots){
          if(snapshots.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),);
          else if (snapshots.hasError) {
            return Text("${snapshots.error}");}
          else{
            if(snapshots.hasData){
              ResponseFetchCleints response = snapshots.data;
              List<DataFetchClients> data = response.data;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context,index){
                  return ListTile(
                    onTap: ()async{
                      await SharedPrefManager.savePrefString(AppConstant.CREATEDIETUSERID, response.data[index].id);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NewProfile(data:response.data[index])));
                      },
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundImage: data[index].image == null ? AssetImage("assets/images/user.png"):NetworkImage("http://fitnessapp.frantic.in/"+data[index].image)),

                    title: Text(data[index].name,
                      style: TextStyle(
                          fontSize: 17*MediaQuery.of(context).textScaleFactor,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),),

                    trailing: GestureDetector(
                      onTap: ()async{
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ChatScreenNew(id:response.data[index].id, name:response.data[index].name)));
                        await SharedPrefManager.savePrefString(AppConstant.CREATEDIETUSERID, response.data[index].id);
                        },

                      child: Icon(Icons.message,size: 30,
                      color: Colors.black,),
                    ),

                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data[index].occupations == null?"":data[index].occupations,
                          style: TextStyle(
                              fontSize: 15*MediaQuery.of(context).textScaleFactor,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal
                          ),),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0XFFC9C8CD),),
                      ],
                    ),
                  );
                },
              );
            }else{
              return Center(child: Text("No clients attached yet",
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
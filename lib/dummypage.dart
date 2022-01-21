import 'package:flutter/material.dart';
import 'package:tws/webview.dart';

class DummyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              ElevatedButton(
                child: Text("Bmi Chart", style: TextStyle(fontSize: 20),),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebViewExample("openbmichart")));
                },
              ),

              ElevatedButton(
                child: Text("Body Chart", style: TextStyle(fontSize: 20),),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebViewExample("openbodychart")));
                },
              ),

              ElevatedButton(
                child: Text("Cal Chart", style: TextStyle(fontSize: 20),),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebViewExample("opencalchart")));
                },
              ),

              ElevatedButton(
                child: Text("Run Chart", style: TextStyle(fontSize: 20),),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebViewExample("openrunchart")));
                },
              ),

              ElevatedButton(
                child: Text("Skin Chart", style: TextStyle(fontSize: 20),),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebViewExample("openSkinChart")));
                },
              ),

              ElevatedButton(
                child: Text("Rm Chart", style: TextStyle(fontSize: 20),),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebViewExample("openrmchart")));
                },
              ),
            ],
       ),
        ),
    );
  }
}
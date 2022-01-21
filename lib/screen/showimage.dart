import 'package:flutter/material.dart';

class ShowImage extends StatelessWidget {

  String image;
  ShowImage({this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
        body: Container(
          child: Image.network(image,fit: BoxFit.fill,),
        ));
  }
}

import 'package:flutter/material.dart';

class TransformationImage extends StatelessWidget {

  final String image;
  TransformationImage({this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.network(image),
    );
  }
}
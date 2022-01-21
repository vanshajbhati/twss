import 'package:flutter/material.dart';

class MyHomePages extends StatefulWidget {

  @override
  _MyHomePagesState createState() => _MyHomePagesState();
}

class _MyHomePagesState extends State<MyHomePages> {
  // This is just for demo
  List<String> _items = ['Item 1', 'Item 2', 'Item 3'];

  Widget get listTile{
    return ListView.builder(
        itemCount: _items.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index){
          // This is a widget which is created out of this widget
          // and created with private instance, every instance
          // will be having it's own bool to show/hide the Row
          // There is a widget named ListTileWidget mentioned in the code
          return ListTileWidget(title: _items[index]);
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("das"),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: listTile
        )
    );
  }
}

class ListTileWidget extends StatefulWidget {
  final String title;
  ListTileWidget({this.title});

  @override
  _ListTileWidget createState() => _ListTileWidget();
}


class _ListTileWidget extends State<ListTileWidget> {
  // This is for individual ListTile reference
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
              title: Text(widget.title),
              onTap: () => setState((){ isSelected = !isSelected; }) // doing toggle
          ),
          // for each listtile individually, it shows/hide Row accordingly
          isSelected
              ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Edit"),
                SizedBox(width: 50.0),
                Text("Delete")
              ]
          ) : Container()
        ]
    );
  }
}
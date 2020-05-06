import 'package:flutter/material.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';

void main() => runApp(new MyApp1());

class MyApp1 extends StatelessWidget {

  _handleAddShelf() async {
    var result = await HttpUtils.post(
      '/SystemInformation/getAll',
    );
    // print(result);
  }

  @override
  Widget build(BuildContext context) {
    _handleAddShelf();
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          child: new Text('Hello World'),
        ),
      ),
    );
  }

  // POST 请求

}
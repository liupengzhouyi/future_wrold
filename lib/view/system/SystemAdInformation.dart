import 'package:flutter/material.dart';
import 'package:futurewrold/utils/page/TempPage.dart';

void main() {
  runApp(new MaterialApp(
    title: 'navigate demo',
    home: new FirstScreen(),));
}

class FirstScreen extends StatelessWidget {
  get title => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('First page'),),
      body: Center(child: RaisedButton(
          child: Text('Go to 2nd page'),
          onPressed: () {
            print('This is first page');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TempPage(title: "122",),));
          }),),);
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('${this} hashCode=${this.hashCode}');
    return Scaffold(appBar: AppBar(title: Text('Second page'),),
      body: Center(child: RaisedButton(
          child: Text("Go back"),
          onPressed: () {
            print('This is 2nd page');
            Navigator.pop(context);
          }),),);
  }
}
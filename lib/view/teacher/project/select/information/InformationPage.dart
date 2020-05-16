import 'package:flutter/material.dart';

class InformationPage extends StatefulWidget {

  String titleId;


  InformationPage(this.titleId);

  @override
  _InformationPageState createState() => _InformationPageState(this.titleId);
}

class _InformationPageState extends State<InformationPage> {

  String titleId;


  _InformationPageState(this.titleId);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

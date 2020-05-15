

import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/myProject/select/ReturnObject.dart';

class PaperFileCard extends StatefulWidget {

  PaperFileCard(this.returnObject);

  ReturnObject returnObject;

  @override
  _PaperFileCardState createState() => _PaperFileCardState(this.returnObject);


}

class _PaperFileCardState extends State<PaperFileCard> {

  _PaperFileCardState(this.returnObject);

  ReturnObject returnObject;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}

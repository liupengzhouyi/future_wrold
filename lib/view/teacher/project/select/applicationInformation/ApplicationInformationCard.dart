import 'package:flutter/material.dart';

import 'package:futurewrold/model/teacher/project/select/applicationInformation/ReturnObject.dart';

class ApplicationInformationCard extends StatefulWidget {

  ReturnObject returnObject;


  ApplicationInformationCard(this.returnObject);

  @override
  _ApplicationInformationCardState createState() => _ApplicationInformationCardState(this.returnObject);
}

class _ApplicationInformationCardState extends State<ApplicationInformationCard> {

  ReturnObject returnObject;


  _ApplicationInformationCardState(this.returnObject);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

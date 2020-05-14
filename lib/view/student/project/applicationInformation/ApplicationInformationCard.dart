import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/project/applicationInformation/ReturnObject.dart';

class ApplicationInformationCard extends StatefulWidget {

  ReturnObject returnObject;


  ApplicationInformationCard(this.returnObject);

  @override
  _ApplicationInformationCardState createState() => _ApplicationInformationCardState(this.returnObject);
}

class _ApplicationInformationCardState extends State<ApplicationInformationCard> {

  ReturnObject returnObject;


  _ApplicationInformationCardState(this.returnObject);

  Widget page;


  @override
  void initState() {
    page = ListTile(
      leading: new CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(Icons.list),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: page,
    );
  }


  createCard() {

  }

}

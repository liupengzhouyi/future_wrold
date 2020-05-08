
import 'package:flutter/material.dart';
import 'package:futurewrold/model/professional/ReturnObject.dart';
import 'package:futurewrold/model/professional/ReturnProfessionalInformation.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';

void main() {
  runApp(ShowProfessionalInformation());
}

class ShowProfessionalInformation extends StatefulWidget {
  @override
  _ShowProfessionalInformationState createState() => _ShowProfessionalInformationState();
}

class _ShowProfessionalInformationState extends State<ShowProfessionalInformation> {

  Widget page;
  ReturnProfessionalInformation returnProfessionalInformation;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('专业信息查询表'),
        ),
        body: page,
      ),
    );
  }

  @override
  void initState() {
    page = new Center(
      child: Icon(
        Icons.cached,
        color: Colors.pink,
        size: 40.0,
        semanticLabel: 'Text to announce in accessibility modes',
      ),
    );
    String url = "/Professional/getAll";
    getProfessionalInformation(url);
    setState(() {
      page;
    });
  }

  getProfessionalInformation(String url)  async {
    var result = await HttpUtils.request(
      url,
      method: HttpUtils.POST,
    );
    returnProfessionalInformation = ReturnProfessionalInformation.fromJson(result);
    createPage();
  }

  createItem(ReturnObject item, Color color) {
    return Container(
      height: 50,
      color: color,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(item.college, textAlign: TextAlign.center),
          ),
          Expanded(
            child: Text(item.professional, textAlign: TextAlign.center),
          ),
          Expanded(
            child: Text(item.number, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }

  createPage() {
    List<Widget> myListView = new List();
    Color color1 = Colors.white;
    Color color2 = Colors.black12;
    Color color = color1;
    for (ReturnObject item in returnProfessionalInformation.returnObject) {
      myListView.add(createItem(item, color));
      color = color == color1 ? color2 : color1;
    }
    page = ListView(
      padding: const EdgeInsets.all(8),
      children: myListView,
    );
    setState(() {
      page = page;
    });
  }
}

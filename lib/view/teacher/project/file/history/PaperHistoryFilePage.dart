
import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/project/file/history/GetPaperHistoryFile.dart';
import 'package:futurewrold/model/teacher/project/file/history/ReturnGetPaperHistoryFile.dart';
import 'package:futurewrold/model/teacher/project/file/history/ReturnObject.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';
import 'package:futurewrold/view/teacher/project/file/history/PaperListView.dart';


class PaperHistoryFilePage extends StatefulWidget {

  PaperHistoryFilePage(this.id, this.name);

  String id;

  String name;

  @override
  _PaperHistoryFilePageState createState() => _PaperHistoryFilePageState(this.id, this.name);
}

class _PaperHistoryFilePageState extends State<PaperHistoryFilePage> {

  _PaperHistoryFilePageState(this.id, this.name);

  String id;

  String name;

  Widget page;


  @override
  void initState() {
    page = new Center(
      child: new Icon(
        Icons.block,
        color: Colors.red,
        size: 64,
      ),
    );
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(name + "历史记录"),
      ),
      body: page,
    );
  }


  Future<void> getData() async {
    GetPaperHistoryFile getPaperHistoryFile = new GetPaperHistoryFile();
    getPaperHistoryFile.titleid = int.parse(id);
    getPaperHistoryFile.name = name;
    var result = await HttpUtils.request(
      '/projectfile/getAllByTitleIdAndNameFalse',
      method: HttpUtils.POST,
      data: getPaperHistoryFile.toJson(),
    );
    ReturnGetPaperHistoryFile returnGetPaperHistoryFile = ReturnGetPaperHistoryFile.fromJson(result);
    if (returnGetPaperHistoryFile.returnKey == true) {
      List<ReturnObject> list = returnGetPaperHistoryFile.returnObject;
      if (list.length == 0) {
        createErrorPage();
      } else {
        createPaerFileHostoryListView(list);
      }
    } else {
      createErrorPage();
    }
  }

  void createPaerFileHostoryListView(List<ReturnObject> list) {
    page = PaperListView(list);
    setState(() {
      page;
    });
  }

  void createErrorPage() {
    setState(() {
      page;
    });
  }
}

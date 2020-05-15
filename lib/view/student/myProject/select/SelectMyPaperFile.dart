import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/myProject/select/ReturnObject.dart';
import 'package:futurewrold/model/student/myProject/select/ReturnSelectMyPaperFileEntity.dart';
import 'package:futurewrold/model/student/myProject/select/SelectMyPaperFileEntity.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';
import 'package:futurewrold/view/student/myProject/select/PaperListView.dart';

class SelectMyPaperFile extends StatefulWidget {

  String titleid;

  SelectMyPaperFile(this.titleid);

  @override
  _SelectMyPaperFileState createState() => _SelectMyPaperFileState(this.titleid);
}

class _SelectMyPaperFileState extends State<SelectMyPaperFile> {

  _SelectMyPaperFileState(this.titleid);

  String titleid;

  Widget page;

  @override
  void initState() {
    page = new Center(child: Icon(Icons.block, color: Colors.red, size: 64,),);
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("我的毕设记录"),
      ),
      body: page,
    );
  }


  Future<void> getData() async {
    SelectMyPaperFileEntity selectMyPaperFileEntity = new SelectMyPaperFileEntity();
    selectMyPaperFileEntity.titleid = int.parse(titleid);
    var result = await HttpUtils.request(
      '/projectfile/getAllByTiitleIdTrue',
      method: HttpUtils.POST,
      data: selectMyPaperFileEntity.toJson(),
    );
    ReturnSelectMyPaperFileEntity returnSelectMyPaperFileEntity = ReturnSelectMyPaperFileEntity.fromJson(result);
    if (returnSelectMyPaperFileEntity.returnKey == true) {
      List<ReturnObject> list =  returnSelectMyPaperFileEntity.returnObject;
      if (list.length == 0) {
        createErrorPage();
      } else {
        createMyPaperFileList(list);
      }
    } else {
      createErrorPage();
    }
  }

  void createMyPaperFileList(List<ReturnObject> list) {
    page = PaperListView(list);
    setState(() {
      page;
    });
  }

  void createErrorPage() {
    page = new Center(child: Icon(Icons.block, color: Colors.red, size: 64,),);
    setState(() {
      page;
    });
  }

}




































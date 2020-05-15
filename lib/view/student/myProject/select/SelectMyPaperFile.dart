import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/myProject/select/SelectMyPaperFileEntity.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';

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
    page = Icon(Icons.assignment);

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

  }


}




































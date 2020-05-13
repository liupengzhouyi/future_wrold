import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/project/select/ReturnObject.dart';
import 'package:futurewrold/model/student/project/select/ReturnSelectTeacherPaperEntity.dart';
import 'package:futurewrold/model/student/project/select/SelectTeacherPaperEntity.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';

class SelectTeacherPaper extends StatefulWidget {

  SelectTeacherPaper(this.teachernumber);

  String teachernumber;

  @override
  _SelectTeacherPaperState createState() => _SelectTeacherPaperState(this.teachernumber);


}

class _SelectTeacherPaperState extends State<SelectTeacherPaper> {

  _SelectTeacherPaperState(this.teachernumber);

  SelectTeacherPaperEntity selectTeacherPaperEntity = new SelectTeacherPaperEntity();

  String teachernumber;

  Widget page;

  @override
  void initState() {
    selectTeacherPaperEntity.teacherid = int.parse(teachernumber);
    getData();
    page = Center(child: Icon(Icons.find_replace, color: Colors.lightGreenAccent, size: 64,),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("题目列表"),),
      body: Container(
        child: page,
      ),
    );
  }


  Future<void> getData() async {
    var result = await HttpUtils.request(
      '/project/getAllByTeacherId',
      method: HttpUtils.POST,
      data: selectTeacherPaperEntity.toJson(),
    );
    print(result);
    ReturnSelectTeacherPaperEntity returnSelectTeacherPaperEntity = ReturnSelectTeacherPaperEntity.fromJson(result);
    if (returnSelectTeacherPaperEntity.returnKey == true) {
      if (returnSelectTeacherPaperEntity.returnObject.length == 0) {
        List<ReturnObject> list = returnSelectTeacherPaperEntity.returnObject;
        createSuccessPage(list);
      } else {
        createErrorPage();
      }
    } else {
      createErrorPage();
    }
  }

  createSuccessPage(List<ReturnObject> list) {

  }

  createErrorPage() {
    page = Text('没有数据');
  }

}

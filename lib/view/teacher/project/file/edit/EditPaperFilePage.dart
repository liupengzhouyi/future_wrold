import 'package:flutter/material.dart';
import 'package:futurewrold/model/teacher/project/file/edit/ReturnTeacherEditPaperFile.dart';
import 'package:futurewrold/model/teacher/project/file/edit/TeacherEditPaperFile.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';

class EditPaperFilePage extends StatefulWidget {

  EditPaperFilePage(this.paperFileId, this.paperFileName);

  String paperFileId;

  String paperFileName;

  @override
  _EditPaperFilePageState createState() => _EditPaperFilePageState(this.paperFileId, this.paperFileName);
}

class _EditPaperFilePageState extends State<EditPaperFilePage> {

  _EditPaperFilePageState(this.paperFileId, this.paperFileName);

  String paperFileId;

  String paperFileName;

  Widget page;

  final TextEditingController _controller = new TextEditingController();

  void init() {
    page = Column(
      children: <Widget>[
        Container(
          constraints: BoxConstraints(
            maxHeight: 200.0,
            minHeight: 50.0,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          padding: EdgeInsets.only(
            left: 16.0, right: 16.0, top: 8.0, bottom: 4.0
          ),
          child: TextField(
            controller: _controller,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            autofocus: true,
            decoration: InputDecoration.collapsed(
              hintText: "指导意见",
            ),
          ),
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildButtonColumn(Icons.delete, '不通过', 2,  Colors.red,),
            buildButtonColumn(Icons.check_circle, '通过', 1, Colors.green,),
          ],
        ),
      ],
    );
    setState(() {
      page;
    });
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("论文指导意见"),
      ),
      body: page,
    );
  }


  Column buildButtonColumn(IconData icon, String label, int index, Color color) {
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new IconButton(
          icon: new Icon(icon, color: color, size: 64,),
          onPressed: () {
            if (index == 1) {
              editPaperFile();
            }
            if (index == 2) {
              _controller.clear();
            }
          },
          color: Colors.blueAccent,
          highlightColor: Colors.red,
        ),
      ],
    );
  }

  Future<void> editPaperFile() async {
    TeacherEditPaperFile teacherEditPaperFile = new TeacherEditPaperFile();
    teacherEditPaperFile.id = int.parse(paperFileId);
    teacherEditPaperFile.approval = _controller.text;
    var result = await HttpUtils.request(
      '/projectfile/approvalPaperFile',
      method: HttpUtils.POST,
      data: teacherEditPaperFile.toJson(),
    );
    ReturnTeacherEditPaperFile returnTeacherEditPaperFile = ReturnTeacherEditPaperFile.fromJson(result);
    if (returnTeacherEditPaperFile.returnKey == true) {
      Text Approval = new Text('添加成功');
      _controller.clear();
      showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('导师添加指导记录'),
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  Approval,
                ],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('确定'),
                onPressed: () {
                  // applicationPaperFunction();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      ).then((val) {
        print(val);
      });
    } else {
      Text Approval = new Text('添加失败');
      showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('导师添加指导记录'),
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  Approval,
                ],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('确定'),
                onPressed: () {
                  // applicationPaperFunction();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      ).then((val) {
        print(val);
      });
    }
  }

}

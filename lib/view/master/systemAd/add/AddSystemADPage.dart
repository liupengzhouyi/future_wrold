import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futurewrold/model/master/systemAd/Master/Master.dart';
import 'package:futurewrold/model/master/systemAd/Master/ReturnMaster.dart';
import 'package:futurewrold/model/master/systemAd/Master/ReturnObject.dart';
import 'package:futurewrold/model/master/systemAd/MasterAddSystemAD.dart';
import 'package:futurewrold/model/master/systemAd/ReturnMasterAddSystemAD.dart';
import 'package:futurewrold/model/user/UserInformation.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';
import 'package:path_provider/path_provider.dart';

class AddSystemADPage extends StatefulWidget {
  @override
  _AddSystemADPageState createState() => _AddSystemADPageState();
}

class _AddSystemADPageState extends State<AddSystemADPage> {

  final TextEditingController _controller = new TextEditingController();

  TextEditingController nameController = TextEditingController();

  UserInformation tempUserInformation;

  @override
  void initState() {
    readCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 40,),
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
            controller: nameController,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            autofocus: true,
            decoration: InputDecoration.collapsed(
              hintText: "标题",
            ),
          ),
        ),
        SizedBox(height: 10,),
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
              hintText: "内容",
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
              addSystemAD();
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

  Future<void> addSystemAD() async {
    MasterAddSystemAD masterAddSystemAD = new MasterAddSystemAD();
    masterAddSystemAD.authorid = int.parse(tempUserInformation.userNumber);
    masterAddSystemAD.title = nameController.text;
    masterAddSystemAD.lpcontent = _controller.text;
    var result = await HttpUtils.request(
      '/SystemInformation/add',
      method: HttpUtils.POST,
      data: masterAddSystemAD.toJson(),
    );
    ReturnMasterAddSystemAD returnMasterAddSystemAD = ReturnMasterAddSystemAD.fromJson(result);
    if (returnMasterAddSystemAD.returnKey == true) {
      Text Approval = new Text('添加成功');
      _controller.clear();
      nameController.clear();
      showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('添加系统公告'),
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
            title: new Text('添加系统公告'),
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


  // _getLocalFile函数，获取本地文件目录
  Future<File> _getLocalFile() async {
    // 获取本地文档目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    print(dir);
    // 返回本地文件目录
    return new File('$dir/userInformation.txt');
  }

  // 保存登陆数据
  void saveValue(UserInformation userInformation) async {
    try {
      File f = await _getLocalFile();
      IOSink slink = f.openWrite(mode: FileMode.append);
      slink.write('${userInformation.toString()}');
      slink.close();
    } catch (e) {
      // 写入错误
      print(e);
    }
  }



  void readCounter() async {
    try {
      File file = await _getLocalFile();
      var dir_bool = await file.exists();
      if (!dir_bool) {
        file.create();
        UserInformation userInformation = new UserInformation();
        userInformation.landing = 0;
        saveValue(userInformation);
      }
      // 从文件中读取变量作为字符串，一次全部读完存在内存里面
      var contents = await file.readAsString();
      var jsonMap = await json.decode(contents);
      UserInformation userInformation = UserInformation.fromJson(jsonMap);
      tempUserInformation = userInformation;
      setState(() {
        tempUserInformation;
      });
      getMasterID(tempUserInformation);
    } on FileSystemException {
    }
  }

  Future<void> getMasterID(UserInformation userInformation) async {
    Master master = new Master();
    master.phonenumber = tempUserInformation.userNumber;
    var result = await HttpUtils.request(
      '/Conservator/selectPhoneNumber',
      method: HttpUtils.POST,
      data: master.toJson(),
    );
    ReturnMaster returnMaster = ReturnMaster.fromJson(result);
    Text Approval = new Text('没有读取到用户文件');
    if (returnMaster.returnKey == true) {
      if (returnMaster.returnObject.length == 0) {
        showDialog<Null>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text('Error', style: TextStyle(color: Colors.red),),
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
        ReturnObject returnObject = returnMaster.returnObject[0];
        tempUserInformation.userNumber = returnObject.id.toString();
        setState(() {
          tempUserInformation;
        });
      }
    } else {
      showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('Error', style: TextStyle(color: Colors.red),),
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

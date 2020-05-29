import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futurewrold/model/user/UserInformation.dart';
import 'package:futurewrold/view/student/group/select/SelectMyGroupPage.dart';
import 'package:futurewrold/view/student/myInformation/MyPage.dart';
import 'package:futurewrold/view/student/myProject/information/MyPaperPage.dart';
import 'package:futurewrold/view/system/getAllSystemAD.dart';
import 'package:path_provider/path_provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: StudentFirstPage(),
    );
  }
}

/**
 * 有状态StatefulWidget
 *  继承于 StatefulWidget，通过 State 的 build 方法去构建控件
 */

class StudentFirstPage extends StatefulWidget {
  ////通过构造方法传值
  StudentFirstPage();

  //主要是负责创建state
  @override
  StudentFirstPageState createState() => StudentFirstPageState();
}

class StudentFirstPageState extends State<StudentFirstPage> {

  UserInformation userInformation;

  StudentFirstPageState();

  @override
  void initState() {
    ///初始化，这个函数在生命周期中只调用一次
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //构建页面
    return buildBottomTabScaffold();
  }

  //当前显示页面的
  int currentIndex = 0;

  //底部导航栏显示的内容
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      icon: Icon(Icons.home),
      title: Text("群组"),
    ),
    /*BottomNavigationBarItem(
      backgroundColor: Colors.blue[600],
      icon: Icon(Icons.format_indent_increase),
      title: Text("毕设"),
    ),*/
    BottomNavigationBarItem(
      backgroundColor: Colors.blue[800],
      icon: Icon(Icons.message),
      title: Text("动态"),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.blue[900],
      icon: Icon(Icons.person),
      title: Text("我的"),
    ),
  ];

  //点击导航项是要显示的页面
  final pages = [
    SelectMyGroupPage(),
    // MyPaperPage(userInformation.userNumber.toString()),
    GetAllSystemAD(),
    MyPage()
  ];

  Widget buildBottomTabScaffold() {
    // readCounter();
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentIndex,
        //所以一般都是使用fixed模式，此时，导航栏的图标和标题颜色会使用fixedColor指定的颜色，
        // 如果没有指定fixedColor，则使用默认的主题色primaryColor
        type: BottomNavigationBarType.fixed,
        //底部菜单点击回调
        onTap: (index) {
          _changePage(index);
        },
      ),
      //对应的页面
      body: pages[currentIndex],
    );
  }

  /*切换页面*/
  void _changePage(int index) {
    /*如果点击的导航项不是当前项  切换 */
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }

  // _getLocalFile函数，获取本地文件目录
  /*Future<File> _getLocalFile() async {
    // 获取本地文档目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    print(dir);
    // 返回本地文件目录
    return new File('$dir/userInformation.txt');
  }

  void readCounter() async {
    try {
      File file = await _getLocalFile();
      var dir_bool = await file.exists();
      if (!dir_bool) {
        file.create();
        userInformation = new UserInformation();
        userInformation.landing = 0;
        saveValue(userInformation);
      }
      // 从文件中读取变量作为字符串，一次全部读完存在内存里面
      var contents = await file.readAsString();
      var jsonMap = await json.decode(contents);
      setState(() {
        userInformation = UserInformation.fromJson(jsonMap);
      });
    } on FileSystemException {
    }
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
  }*/
}

//子页面
class ChildItemView extends StatefulWidget {
  String _title;

  ChildItemView(this._title);

  @override
  _ChildItemViewState createState() => _ChildItemViewState();
}

class _ChildItemViewState extends State<ChildItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(widget._title)),
    );
  }
}
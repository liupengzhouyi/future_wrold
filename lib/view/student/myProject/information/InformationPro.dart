import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/myProject/information/Project.dart';
import 'package:futurewrold/model/student/myProject/information/Selecttitle.dart';
import 'package:futurewrold/model/student/myProject/information/Student.dart';
import 'package:futurewrold/model/student/myProject/information/Teacher.dart';

class InformationPro extends StatefulWidget {

  Student student;
  Teacher teacher;
  Selecttitle selectTitle;
  Project project;

  InformationPro(this.student, this.teacher, this.selectTitle, this.project);

  _InformationProState createState() => _InformationProState(this.student, this.teacher, this.selectTitle, this.project);
}

class _InformationProState extends State<InformationPro> {
  
  List<int> mList;   //组成一个int类型数组，用来控制索引

  List<ExpandStateBean> expandStateList;  //开展开的状态列表,ExpandStateBean是自定义的类

  Student student;
  Teacher teacher;
  Selecttitle selectTitle;
  Project project;


  _InformationProState(this.student, this.teacher, this.selectTitle, this.project) {
    mList=new List();

    expandStateList=new List();

    //遍历两个List进行赋值
    for(int i=0;i<4;i++){
      mList.add(i);
      expandStateList.add(ExpandStateBean(i,false));//item初始状态为闭着的
    }
  }

  //修改展开与闭合的内部方法
  _setCurrentIndex(int index,isExpand){
    setState(() {
      //遍历可展开状态列表
      expandStateList.forEach((item){
        if(item.index==index){
          //取反，经典取反方法
          item.isOpen=!isExpand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: ExpansionPanelList(
          //交互回调属性，里面是个匿名函数
          expansionCallback: (index,bol){
            //调用内部方法
            _setCurrentIndex(index, bol);
          },
          //进行map操作，然后用toList再次组成List
          children: <ExpansionPanel>[
            ExpansionPanel(
                headerBuilder: (context,isExpanded){
                  return ListTile(
                    title: Text('我的信息'),
                  );
                },
                body: Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: ListBody(
                    children: <Widget>[
                      ListBody(
                        children: <Widget>[
                          ListTile(
                            leading: new CircleAvatar(
                              // child: Icon(Icons.account_circle, size: 24, ),
                              backgroundImage: NetworkImage(student.imageurl),
                            ),
                            title: new Text(student.name, style: TextStyle(fontSize: 24),),
                          ),

                        ],
                      ),
                      SizedBox(height: 5,),
                      ListBody(
                        children: <Widget>[
                          ListTile(
                            leading: new CircleAvatar(
                              child: Icon(Icons.school, size: 24, ),
                            ),
                            title: new Text("学生编号：" + teacher.teachernumber, style: TextStyle(fontSize: 24),),
                          ),

                        ],
                      ),
                      SizedBox(height: 5,),
                      ListBody(
                        children: <Widget>[
                          ListTile(
                            leading: new CircleAvatar(
                              child: Icon(Icons.account_balance, size: 24, ),
                            ),
                            title: new Text("专业编号：" + student.prodessionalid.toString(), style: TextStyle(fontSize: 24),),
                          ),

                        ],
                      ),
                      SizedBox(height: 5,),
                      ListBody(
                        children: <Widget>[
                          ListTile(
                            leading: new CircleAvatar(
                              child: Icon(Icons.phone, size: 24, ),
                            ),
                            title: new Text("联系方式：" + student.phonenumber, style: TextStyle(fontSize: 24),),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                isExpanded: expandStateList[0].isOpen
            ),
            ExpansionPanel(
                headerBuilder: (context,isExpanded){
                  return ListTile(
                    title: Text('导师信息'),
                  );
                },
                body: Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: ListBody(
                    children: <Widget>[
                      ListBody(
                        children: <Widget>[
                          ListTile(
                            leading: new CircleAvatar(
                              // child: Icon(Icons.account_circle, size: 24, ),
                              backgroundImage: NetworkImage(teacher.imageurl),
                            ),
                            title: new Text(teacher.name, style: TextStyle(fontSize: 24),),
                          ),

                        ],
                      ),
                      SizedBox(height: 5,),
                      ListBody(
                        children: <Widget>[
                          ListTile(
                            leading: new CircleAvatar(
                              child: Icon(Icons.school, size: 24, ),
                            ),
                            title: new Text("教师编号：" + teacher.teachernumber, style: TextStyle(fontSize: 24),),
                          ),

                        ],
                      ),
                      SizedBox(height: 5,),
                      ListBody(
                        children: <Widget>[
                          ListTile(
                            leading: new CircleAvatar(
                              child: Icon(Icons.account_balance, size: 24, ),
                            ),
                            title: new Text("专业编号：" + teacher.professionalid, style: TextStyle(fontSize: 24),),
                          ),

                        ],
                      ),
                      SizedBox(height: 5,),
                      ListBody(
                        children: <Widget>[
                          ListTile(
                            leading: new CircleAvatar(
                              child: Icon(Icons.phone, size: 24, ),
                            ),
                            title: new Text("联系方式：" + teacher.phonenumber, style: TextStyle(fontSize: 24),),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                isExpanded: expandStateList[1].isOpen
            ),
            ExpansionPanel(
                headerBuilder: (context,isExpanded){
                  return ListTile(
                    title: Text('选题信息'),
                  );
                },
                body: Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: ListBody(
                    children: <Widget>[
                      ListBody(
                        children: <Widget>[
                          ListTile(
                            leading: new CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.access_time, size: 24, color: Colors.blue,),
                            ),
                            title: new Text("申请时间", style: TextStyle(fontSize: 14),),
                            subtitle: new Text(selectTitle.applicationdata, style: TextStyle(fontSize: 18),),
                          ),

                        ],
                      ),
                      SizedBox(height: 5,),
                      ListBody(
                        children: <Widget>[
                          ListTile(
                            leading: new CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.access_time, size: 24, color: Colors.lightGreenAccent,),
                            ),
                            title: new Text("通过时间：", style: TextStyle(fontSize: 14),),
                            subtitle: new Text(selectTitle.passdata, style: TextStyle(fontSize: 18),),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                isExpanded: expandStateList[2].isOpen
            ),
            ExpansionPanel(
                headerBuilder: (context,isExpanded){
                  return ListTile(
                    title: Text('题目信息'),
                  );
                },
                body: Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: ListBody(
                    children: <Widget>[
                      ListBody(
                        children: <Widget>[
                          ListTile(
                            leading: new CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.book, size: 24, color: Colors.red,),
                            ),
                            title: new Text(project.title, style: TextStyle(fontSize: 24),),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      ListBody(
                        children: <Widget>[
                          ListTile(
                            leading: new CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.screen_share, size: 24, color: Colors.deepPurpleAccent,),
                            ),
                            title: new Text("查看完成情况", style: TextStyle(fontSize: 24),),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    // builder: (context) => ,
                                  )
                              );
                            },
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                isExpanded: expandStateList[3].isOpen
            ),
          ],
        ),
      ),
    );
  }
}

//list中item状态自定义类
class ExpandStateBean{
  var isOpen;   //item是否打开
  var index;    //item中的索引
  ExpandStateBean(this.index,this.isOpen);
}
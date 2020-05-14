import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/myProject/information/Student.dart';


class InformationAir extends StatefulWidget {

  Student student;

  InformationAir(this.student);

  _InformationAirState createState() => _InformationAirState(this.student);
}

class _InformationAirState extends State<InformationAir> {

  List<int> mList;   //组成一个int类型数组，用来控制索引

  List<ExpandStateBean> expandStateList;  //开展开的状态列表,ExpandStateBean是自定义的类

  Student student;

  _InformationAirState(this.student) {
    mList=new List();

    expandStateList=new List();

    //遍历两个List进行赋值
    for(int i=0;i<1;i++){
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
                body: ListTile(
                  title: Text('expansion no.'),
                ),
                isExpanded: expandStateList[0].isOpen
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
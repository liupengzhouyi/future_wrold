import 'package:flutter/material.dart';
import 'package:futurewrold/model/student/teacher/select/GetTeacherByProfessionalPage/ReturnObject.dart';
import 'package:futurewrold/model/student/teacher/select/GetTeacherByProfessionalPage/GetTeacherByProfessional.dart';
import 'package:futurewrold/model/student/teacher/select/GetTeacherByProfessionalPage/ReturnGetTeacherByProfessional.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';
import 'package:futurewrold/view/student/teacher/select/professional/model/TeacherListView.dart';


class GetTeacherByProfessionalPage extends StatefulWidget {


  String professionalid;


  @override
  _GetTeacherByProfessionalPageState createState() => _GetTeacherByProfessionalPageState(this.professionalid);

  GetTeacherByProfessionalPage(this.professionalid);
}

class _GetTeacherByProfessionalPageState extends State<GetTeacherByProfessionalPage> {

  _GetTeacherByProfessionalPageState(this.professionalid);

  String professionalid;

  Widget page;

  @override
  void initState() {
    getData();
    page = new Icon(Icons.autorenew, color: Colors.yellow, size: 24,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("专业教师"),
      ),
      body: Form(
        child: page,
      ),
    );
  }

  getData() async {
    GetTeacherByProfessional getTeacherByProfessional = new GetTeacherByProfessional();
    getTeacherByProfessional.professionalid = this.professionalid;
    var result = await HttpUtils.request(
      '/teacher/getAllByProfessional',
      method: HttpUtils.POST,
      data: getTeacherByProfessional.toJson(),
    );
    ReturnGetTeacherByProfessional returnGetTeacherByProfessional = ReturnGetTeacherByProfessional.fromJson(result);
    if (returnGetTeacherByProfessional.returnKey == true) {
      List<ReturnObject> list = returnGetTeacherByProfessional.returnObject;
      setState(() {
        page = TeacherListView(list);
      });
    } else {
      setState(() {
        page;
        print('no data');
      });
    }
  }

}

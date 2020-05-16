
import 'package:futurewrold/model/student/myProject/add/AddPaperFile.dart';
import 'package:futurewrold/model/student/myProject/add/ReturnAddPaperFile.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';

class AddPaperFileController {

  AddPaperFileController(this.addPaperFile) {
  }

  AddPaperFile addPaperFile;

  String key;

  Future<void> getData() async {
    var result = await HttpUtils.request(
      '/projectfile/add',
      method: HttpUtils.POST,
      data: addPaperFile.toJson(),
    );
    ReturnAddPaperFile returnAddPaperFile = ReturnAddPaperFile.fromJson(result);
    if (returnAddPaperFile.returnKey == true) {
      key = 'ture';
    } else {
      key = 'false';
    }
    return returnAddPaperFile.returnKey;
  }

}

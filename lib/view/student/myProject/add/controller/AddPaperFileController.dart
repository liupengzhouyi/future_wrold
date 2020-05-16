import 'package:futurewrold/model/student/myProject/add/AddPaperFile.dart';
import 'package:futurewrold/utils/web/HttpUtils.dart';

class AddPaperFileController {

  AddPaperFileController(this.addPaperFile) {
    key = false;
  }

  AddPaperFile addPaperFile;

  bool key;

  Future<void> getData() async {
    var result = await HttpUtils.request(
      '/projectfile/getAllByTitleIdAndNameFalse',
      method: HttpUtils.POST,
      data: addPaperFile.toJson(),
    );

  }

}

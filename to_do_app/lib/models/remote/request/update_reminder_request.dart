import 'package:to_do_app/utils/app_constant.dart';
import 'package:to_do_app/utils/app_helper.dart';

class UpdateReminderRequest {
  Map<String, dynamic> toJson() {
    return {
      "fieldData": {
        "IsRead": 1,
        "Status": "Readed",
        "ReadTime": AppHelper.convertDatetoStringWithFormat(DateTime.now(), DateConstant.dateParseServer),
      }
    };
  }
}

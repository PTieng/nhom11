import 'package:flutter_application_1/db/db_helper.dart';
import 'package:get/get.dart';

import '../models/task.dart';

class TaskController extends GetxController {
  @override
  void onDeady() {
    super.onReady();
  }

  Future<int> addTask({Task ?task}) async{
    return await DBHelper.insert(task!);
  }
}

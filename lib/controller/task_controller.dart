import 'package:flutter_application_1/db/db_helper.dart';
import 'package:get/get.dart';

import '../models/task.dart';

class TaskController extends GetxController {
  @override
  void onDeady() {
    getTaks();
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task!);
  }

  // lấy tất cả data từ bảng
  void getTaks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
  }

  void delete(Task task) {
    DBHelper.delete(task);
    getTaks();
  }

  void martTaskCompleted(int id) async {
    await DBHelper.update(id);
    getTaks();
  }
}

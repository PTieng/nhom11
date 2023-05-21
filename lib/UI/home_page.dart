import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/user_page.dart';
import 'package:flutter_application_1/services/notification_services.dart';
import 'package:flutter_application_1/services/theme_services.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestAndroidPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: const [
          Text(
            "Theme Data",
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: context.theme.colorScheme.background,
      leading: GestureDetector(
        onTap: () {
          ThemeServices().switchTheme();
          notifyHelper.odisplayNotification(
              title: "Theme change",
              body: Get.isDarkMode
                  ? "Chuyen che do sáng thanh cong"
                  : "Chuyen che do tôi thanh cong");
        },
        child: Icon(Icons.nightlight_round,
            size: 20,
            // đổi màu biểu tượng theo chủ đề
            color: Get.isDarkMode ? Colors.white : Colors.black),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserPage()),
            );
          },
          child: CircleAvatar(
            backgroundImage: AssetImage("images/avatar.jpg"),
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}

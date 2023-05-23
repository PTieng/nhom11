import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/add_task_bar.dart';
import 'package:flutter_application_1/UI/second_screen.dart';
import 'package:flutter_application_1/UI/theme.dart';
import 'package:flutter_application_1/UI/user_page.dart';
import 'package:flutter_application_1/UI/widget/button.dart';
import 'package:flutter_application_1/service/local_notification.dart';
import 'package:flutter_application_1/service/theme_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    LocalNotificationService().initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: Column(
          children: [
            _addTaskBar(),
            _addDateBar(),
          ],
        ));
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryColor,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        onDateChange: (date) {
          _selectedDate = date;
        },
      ),
    );
  }

  _addTaskBar() {
    return Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.yMMMMd().format(DateTime.now()),
                    style: subHeadingStyle,
                  ),
                  Text(
                    "Today",
                    style: headingStyle,
                  )
                ],
              ),
            ),
            MyButton(label: "+ Add task", onTap: () => Get.to(AddTaskPage()))
          ],
        ));
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
          LocalNotificationService().showNotification(
              title: 'Theme Changed',
              body: Get.isDarkMode
                  ? 'Activated Dark Theme'
                  : 'Activated Light Theme');
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_outlined,
          size: 25,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
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

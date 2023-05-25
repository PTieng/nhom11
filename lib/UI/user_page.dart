import 'package:flutter/material.dart';
import 'package:flutter_application_1/login/db/databaseHelper.dart';
import 'package:flutter_application_1/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/login/model/user.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool isDarkMode = Get.isDarkMode;
  late User currentUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    User? user = await databaseHelper.getCurrentUser();

    if (user != null) {
      setState(() {
        currentUser = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: isDarkMode ? Colors.white : Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.nightlight_round,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });

              Get.changeThemeMode(
                isDarkMode ? ThemeMode.dark : ThemeMode.light,
              );
            },
          ),
        ],
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("images/avatar.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              currentUser.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              currentUser.email,
              style: const TextStyle(fontSize: 15),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  buildProfileItem(Icons.person, 'Name', currentUser.name),
                  const Divider(
                    color: Color.fromARGB(255, 182, 180, 180),
                    thickness: 1.0,
                  ),
                  buildProfileItem(Icons.email, 'Email', currentUser.email),
                  const Divider(
                    color: Color.fromARGB(255, 182, 180, 180),
                    thickness: 1.0,
                  ),
                  buildProfileItem(Icons.phone, 'Phone', currentUser.phone),
                  const Divider(
                    color: Color.fromARGB(255, 182, 180, 180),
                    thickness: 1.0,
                  ),
                  buildProfileItem(
                      Icons.location_on, 'Address', currentUser.address),
                  const Divider(
                    color: Color.fromARGB(255, 182, 180, 180),
                    thickness: 1.0,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'Log Out',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileItem(IconData icon, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(icon),
        Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

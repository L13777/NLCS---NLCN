import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("D Learning"),
          backgroundColor: const Color.fromARGB(255, 160, 212, 255),
          // elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  print("search funtion");
                },
                icon: Icon(Icons.search)),
            IconButton(
              onPressed: () {
                print("Go to user background");
              },
              icon: Icon(Icons.account_circle_outlined),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 91, 195, 230),
          child: Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.favorite,
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("H O M E"),
                onTap: () {},
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 230, 225, 255),
      ),
    );
  }
}

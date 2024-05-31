import 'package:flutter/material.dart';
import 'package:learning_app/pages/home_page.dart';
import 'package:learning_app/pages/search_page.dart';
import 'package:learning_app/pages/calendar_page.dart';
import 'package:learning_app/pages/user_page.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key, required course});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;
  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    CalendarPage(),
    UserPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DayDream Learner'),
          actions: <Widget>[
            findIcon(),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              // tạo khoảng cách ở trên
              AppBar(
                title: Center(
                  child: Text('Welcome'),
                ),
                automaticallyImplyLeading: false,
              ),

              // các chuyên môn hoặc ngành học
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text('Công Nghệ Thông Tin'),
                onTap: () {},
              ),

              //
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text('Lập trình hướng đối tượng'),
                onTap: () {},
              ),

              //
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text('Phân tích và Thiết kế Thuật Toán'),
                onTap: () {},
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          unselectedItemColor: Colors.red,
          items: const <BottomNavigationBarItem>[
            // home_page
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),

            // search_page
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: 'Search',
            ),

            // calendar_page
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month_outlined,
              ),
              label: 'Calendar',
            ),

            // user_page
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'User',
            ),
          ],
          currentIndex: _index,
          onTap: _onItemTapped,
        ),
        body: _pages[_index]
        //   MaterialApp(
        // debugShowCheckedModeBanner: false,
        // home: CalendarPage(),
        // ),
        );
  }

  Widget findIcon() {
    return IconButton(
      onPressed: () {
        print('chuyển sang chế độ tìm kiếm');
      },
      icon: Icon(Icons.search),
    );
  }
}

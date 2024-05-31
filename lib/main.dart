import 'package:flutter/material.dart';
import 'package:learning_app/models/course.dart';
import 'package:learning_app/pages/main_page.dart';

// import 'package:supertokens_flutter/supertokens.dart';

// import 'package:supertokens_flutter/http.dart' as http;

// //Kiểm tra session có tổn tại không
// Future<bool> doesSessionExist() async {
//   return await SuperTokens.doesSessionExist();
// }

// //Sử dụng với http, các yêu cầu mạng
// Future<void> makeRequest() async {
//   Uri uri = Uri.parse("http://localhost:3000/api");

//   var response = await http.get(uri);
// }

// // Đăng xuất
// Future<void> signOut() async {
//   await SuperTokens.signOut();
// }

// // Lấy Id người dùng
// Future<String> getUserId() async {
//   return await SuperTokens.getUserId();
// }

// // Làm mới session thủ công
// Future<void> manualRefresh() async {
//   // Returns true if session was refreshed, false if session is expired
//   var success = await SuperTokens.attemptRefreshingSession();
// }

void main() {
  // Khởi tạo sdk
  // SuperTokens.init(
  //   apiDomain: "http://localhost:8080",
  //   apiBasePath: "/auth",
  //   // webDomain: "http://localhost:3000"
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(
        course: Course,
      ),
    );
  }
}

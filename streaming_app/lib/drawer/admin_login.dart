import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streaming_app/drawer/add_movies.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void login() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("email", 'apu2373@gmail.com');
    prefs.setString("password", '123456');
    final email = prefs.getString('email');
    print(email);
    final pass = prefs.getString('password');
    print(pass);
    if (emailController == email && passwordController == pass) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => AddMOvies()));
    }
  }

  // void getLoginInfo() async {
  //   final email = await SharedPreferences.getInstance();
  //   final password = await SharedPreferences.getInstance();
  //   if()
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              key: ValueKey("Enter your email"),
              decoration: InputDecoration(
                  hintText: "Enter your email", border: UnderlineInputBorder()),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: passwordController,
              key: ValueKey("Enter your password"),
              decoration: InputDecoration(
                  hintText: "Enter your password",
                  border: UnderlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: login,
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.red),
                )),
          ],
        ),
      ),
    );
  }
}

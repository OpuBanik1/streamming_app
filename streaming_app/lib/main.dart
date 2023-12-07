import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:streaming_app/home_page.dart';
import 'package:streaming_app/splash%20screen/7days_free_service.dart';
import 'package:streaming_app/splash%20screen/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // SharedPreferences pref = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: Colors.white54,
          brightness: Brightness.dark,
          // primarySwatch: Colors.blue,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return FreeSubscription();
              //  HomePage();
              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(builder: (context) => HomePage()),
              //     (route) => false);
            } else {
              return LoginForm();
            }
            // return CircularProgressIndicator();
          },
        ));
  }
}

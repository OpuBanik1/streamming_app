import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streaming_app/home_page.dart';
import 'package:streaming_app/splash%20screen/payment_gateway.dart';

class FreeSubscription extends StatefulWidget {
  // final SharedPreferences prefs;
  // const FreeSubscription({super.key, required this.prefs});

  @override
  State<FreeSubscription> createState() => _FreeSubscriptionState();
}

class _FreeSubscriptionState extends State<FreeSubscription> {
  int loginCount = 0;
  @override
  void initState() {
    checkLoginCount();
    // TODO: implement initState
    super.initState();
  }

  void checkLoginCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int lastLoginTimestamp = prefs.getInt('lastLoginTimestamp') ?? 0;
    DateTime lastLoginDate =
        DateTime.fromMillisecondsSinceEpoch(lastLoginTimestamp);
    // print("lastLoginDate");
    DateTime now = DateTime.now();
    Duration difference = now.difference(lastLoginDate);
    int elapsedDays = difference.inDays;

    if (elapsedDays >= 7) {
      setState(() {
        loginCount = 0;
      });
    } else {
      setState(() {
        loginCount = prefs.getInt('loginCount') ?? 0;
        loginCount++;
      });
      prefs.setInt('loginCount', loginCount);
    }

    prefs.setInt('lastLoginTimestamp', now.millisecondsSinceEpoch);
  }

  @override
  Widget build(BuildContext context) {
    // Show payment page after 7 days
    if (loginCount >= 7) {
      return HomePage();
    } else {
      // Replace this with your home page or initial screen
      return HomePage();
    }
  }
}

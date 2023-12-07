import 'package:flutter/material.dart';
import 'package:streaming_app/drawer/admin_login.dart';

import 'package:streaming_app/home_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    ButtonItem(
                      icon: Icons.home,
                      title: 'Home',
                      ontap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage()));
                      },
                    ),
                    ButtonItem(
                      icon: Icons.notification_add,
                      title: 'Snooze Notifications',
                      ontap: () {},
                    ),
                    Divider(
                      height: 1,
                      indent: 10,
                      thickness: 5,
                    ),
                    ButtonItem(
                      icon: Icons.add,
                      title: 'Add Movies',
                      ontap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => AdminLogin()));
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ButtonItem extends StatelessWidget {
  ButtonItem({this.icon, this.title, this.ontap, this.clr});
  String? title;
  IconData? icon;
  VoidCallback? ontap;
  Color? clr;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.only(bottom: 20),
      onPressed: ontap,
      child: Row(
        children: [
          Icon(
            icon,
            color: clr,
          ),
          SizedBox(
            width: 20,
          ),
          Text('${title}')
        ],
      ),
    );
  }
}

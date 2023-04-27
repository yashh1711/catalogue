import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountName: Text('Yash'),
              accountEmail: Text('nagar.yash'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/male_avatar.png'),
              ),
              currentAccountPictureSize: Size.fromRadius(30),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.house,
            ),
            title: Text('Home'),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
            ),
            title: Text('My Profile'),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail,
            ),
            title: Text('Email Me'),
          ),
        ],
      ),
    );
  }
}

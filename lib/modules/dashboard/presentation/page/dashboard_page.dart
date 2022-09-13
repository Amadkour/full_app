import 'package:api_project/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          Center(child: Text('post')),
          Center(child: Text('comment')),
          Center(child: Text('profile')),
          Center(child: Text('settings')),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.collections), label: 'Post'),
          BottomNavigationBarItem(icon: Icon(Icons.comment), label: 'Comment'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings), label: 'Settings'),
        ],

      ),

    );
  }
}

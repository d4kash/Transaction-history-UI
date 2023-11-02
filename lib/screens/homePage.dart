import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transaction_demo/screens/dashboard.dart';
import 'package:transaction_demo/screens/profile.dart';
import 'package:transaction_demo/screens/rewards.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            activeColor: Colors.black,
            inactiveColor: Colors.grey.withOpacity(0.6),
            onTap: (index) {
              print("selected index: ${index}");
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.bars), label: 'Dashboard'),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.award), label: 'Rewards'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded), label: 'My Account')
            ]),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return const DashboardPage();

            case 1:
              return const RewardsPage();

            case 2:
              return const ProfilePage();

            default:
          }
          return Container();
        });
  }
}

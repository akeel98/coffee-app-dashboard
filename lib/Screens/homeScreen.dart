import 'package:admin_coffee_app/Screens/authScreens/login_screen.dart';
import 'package:admin_coffee_app/Screens/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pages = const [
    Center(child: Text("Page One")),
    Center(child: Text("Page Two")),
    Center(child: Text("Page Three")),
    Center(child: Text("Page Four")),
    Center(child: Text("Page Five")),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: mainColor,
        body: Row(
          children: [
            Container(
              height: size.height,
              width: size.width * 0.15,
              padding: EdgeInsets.symmetric(
                horizontal: size.height * 0.03,
                vertical: size.height * 0.04,
              ),
              decoration: BoxDecoration(color: Colors.transparent),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "App Name Will Be Here",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: size.height * 0.024,
                    ),
                  ),
                  SizedBox(height: size.height * 0.07),
                  dashboardItem(
                      size: size,
                      onPressed: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      title: 'Dashboard',
                      icon: Icons.dashboard,
                    color: index == 0 ? Colors.grey : Colors.transparent,
                  ),
                  SizedBox(height: size.height * 0.05),
                  dashboardItem(
                    size: size,
                    onPressed: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    title: 'Users',
                    icon: Icons.people,
                    color: index == 1 ? Colors.grey : Colors.transparent,
                  ),
                  SizedBox(height: size.height * 0.05),
                  dashboardItem(
                    size: size,
                    onPressed: () {
                      setState(() {
                        index = 2;
                      });
                    },
                    title: 'Orders',
                    icon: Icons.shopping_cart,
                    color: index == 2 ? Colors.grey : Colors.transparent,
                  ),
                  SizedBox(height: size.height * 0.05),
                  dashboardItem(
                    size: size,
                    onPressed: () {
                      setState(() {
                        index = 3;
                      });
                    },
                    title: 'Products',
                    icon: Icons.shopping_basket_outlined,
                    color: index == 3 ? Colors.grey : Colors.transparent,
                  ),
                  SizedBox(height: size.height * 0.05),
                  dashboardItem(
                    size: size,
                    onPressed: () {
                      setState(() {
                        index = 4;
                      });
                    },
                    title: 'Categories',
                    icon: Icons.category,
                    color: index == 4 ? Colors.grey : Colors.transparent,
                  ),
                ],
              ),
            ),
            Container(
              height: size.height,
              width: size.width * 0.84,
              margin: EdgeInsets.only(
                right: size.height * 0.02,
                top: size.height * 0.02,
                bottom: size.height * 0.02,
              ),
              decoration: BoxDecoration(
                color: lightBackground,
                borderRadius:
                    BorderRadius.all(Radius.circular(size.height * 0.05)),
              ),
              child: pages[index],
            ),
          ],
        ));
  }

  InkWell dashboardItem({required Size size, required Function() onPressed, required String title, required IconData icon,required Color color}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.005),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(size.height * 0.01))
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: size.height * 0.02),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: size.height * 0.03,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

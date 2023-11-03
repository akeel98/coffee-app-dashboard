import 'package:admin_coffee_app/Screens/consts.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: lightBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                mainTitle(title: 'Users', size: size),
                IconButton(onPressed: (){}, icon: Icon(Icons.search))
              ],
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01,
                horizontal: size.height * 0.015
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.symmetric(horizontal: BorderSide(color: Colors.grey[400]!))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("id",style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text("5436346465345546",style: TextStyle(
                      ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("UserName",style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: size.height * 0.02),
                      Text("Akeeeeel wsdsa",style: TextStyle(
                      ),),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Email",style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: size.height * 0.02),
                      Text("akeeel@gmail.com",style: TextStyle(
                      ),),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Settings",style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

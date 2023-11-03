import 'package:flutter/material.dart';

import 'consts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: lightBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   width: size.width,
            //   height: size.height * 0.06,
            //   padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
            //   alignment: Alignment.center,
            //   decoration: const BoxDecoration(
            //     color: Colors.white,
            //   ),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       InkWell(
            //         onTap: () {},
            //         child: Row(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Stack(
            //               alignment: Alignment.center,
            //               children: [
            //                 const Icon(Icons.notifications),
            //                 Positioned(
            //                   top: 0,
            //                   left: 0,
            //                   child: Container(
            //                     width: size.height * 0.015,
            //                     height: size.height * 0.015,
            //                     decoration: const BoxDecoration(
            //                       shape: BoxShape.circle,
            //                       color: Colors.red,
            //                     ),
            //                   ),
            //                 )
            //               ],
            //             ),
            //             Text(
            //               "Notifications",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: size.height * 0.02),
            //             )
            //           ],
            //         ),
            //       ),
            //       SizedBox(width: size.height * 0.035),
            //       InkWell(
            //         onTap: () {},
            //         child: Row(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             const Icon(Icons.settings),
            //             Text(
            //               "Settings",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: size.height * 0.02),
            //             )
            //           ],
            //         ),
            //       ),
            //       SizedBox(width: size.height * 0.035),
            //       InkWell(
            //         onTap: () {},
            //         child: Row(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             CircleAvatar(
            //               backgroundColor: mainColor,
            //               radius: 13,
            //             ),
            //             SizedBox(width: size.height * 0.015),
            //             Text(
            //               "Admin Name",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: size.height * 0.02),
            //             )
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: size.height * 0.005),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mainTitle(title: 'DASHBOARD', size: size),
                  SizedBox(height: size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      statusContainer(
                        size: size,
                        color: Colors.green,
                        title: 'Revenue',
                        subtitle: 'Revenue This Month',
                        number: '0.00',
                      ),
                      statusContainer(
                        size: size,
                        color: Colors.blue,
                        title: 'Products',
                        subtitle: 'Total Products in Store',
                        number: '0.00',
                      ),
                      statusContainer(
                        size: size,
                        color: Colors.red,
                        title: 'Orders',
                        subtitle: 'Total Orders For This Month',
                        number: '0.00',
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width / 1.8,
                        height: size.height * 0.65,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(size.height * 0.05)),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    "https://cdn.venngage.com/template/thumbnail/small/c3818539-d91a-49ba-b26a-98ea90bbeb19.webp"),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        height: size.height * 0.65,
                        width: size.height * 0.53,
                        padding: EdgeInsets.symmetric(
                          horizontal: size.height * 0.01,
                          vertical: size.height * 0.015,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            const BoxShadow(
                              offset: Offset(28, 28),
                              color: Color(0xFFA7A9AF),
                              blurRadius: 30,
                            ),
                          ],
                          borderRadius: BorderRadius.all(
                              Radius.circular(size.height * 0.05)),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Top Buyers",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * 0.025),
                            ),
                            SizedBox(height: size.height * 0.02),
                            topBuyersItem(size),
                            SizedBox(height: size.height * 0.02),
                            topBuyersItem(size),
                            SizedBox(height: size.height * 0.02),
                            topBuyersItem(size),
                            SizedBox(height: size.height * 0.02),
                            topBuyersItem(size),
                            SizedBox(height: size.height * 0.02),
                            topBuyersItem(size),
                            SizedBox(height: size.height * 0.02),
                            topBuyersItem(size),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Row topBuyersItem(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: mainColor,
              radius: size.height * 0.03,
            ),
            SizedBox(width: size.height * 0.02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bueyer Name",
                  style: TextStyle(fontSize: size.height * 0.025),
                ),
                Text(
                  "33 Oreders",
                  style: TextStyle(fontSize: size.height * 0.02),
                ),
              ],
            ),
          ],
        ),
        const Text(
          "\$ 5,60",
          style: TextStyle(color: Colors.green),
        )
      ],
    );
  }

  Container statusContainer({
    required Size size,
    required Color color,
    required String title,
    required String subtitle,
    required String number,
  }) {
    return Container(
      width: size.width / 4,
      height: size.height * 0.12,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(size.height * 0.02))),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        trailing: Text(
          "\$ $number",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: size.height * 0.04,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';


Color mainColor = const Color(0xFF001E36);
Color lightBackground = const Color(0xFFE7EFEC);
Color darkBackground = const Color(0xFF2E3239);
Text mainTitle({required String title, required size}){
  return Text(
    title,
    style: TextStyle(
        fontSize: size.height * 0.05,
        fontWeight: FontWeight.bold),
  );
}

mySnackBar({required context, required String message, required ContentType contentType}) {
  final materialBanner = SnackBar(
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Error',
      message: message,
      contentType: contentType,
      inMaterialBanner: false,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentMaterialBanner()
    ..showSnackBar(materialBanner);
}




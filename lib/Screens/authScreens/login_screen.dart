import 'package:admin_coffee_app/Screens/authScreens/sign_up_screen.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Repository/fireBaseServices.dart';
import '../consts.dart';
import 'login_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController firstName = TextEditingController();

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  bool passObs = true;
  bool confirmPassObs = true;
  bool loading = false;
  bool isDarkMode = false;

  bool emailValid(email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isDarkMode == true ? darkBackground : lightBackground;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF001E36),
      body: SafeArea(
          child: loading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Container(
                    width: size.height * 0.55,
                    height: size.height * 0.6,
                    padding: EdgeInsets.symmetric(
                        horizontal: size.height * 0.033,
                        vertical: size.height * 0.033),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(Radius.circular(size.height * 0.03)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Login To Dashboard",
                            style: TextStyle(
                              fontSize: size.height * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Form(
                            key: _form,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: size.height * 0.03),
                                formField(
                                  size: size,
                                  label: 'Email',
                                  controller: emailController,
                                  validator: (String? val) {
                                    if (val == "" || val!.isEmpty) {
                                      return "This Field Can't be Null !!";
                                    }
                                    if (!emailValid(val)) {
                                      return "Check Your Email";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: size.height * 0.03),
                                formField(
                                  size: size,
                                  label: 'Password',
                                  obscureText: passObs,
                                  suffix: passObs == true
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.visibility_off,
                                  suffixOnPressed: () {
                                    setState(() {
                                      passObs = !passObs;
                                    });
                                  },
                                  controller: passwordController,
                                  validator: (String? val) {
                                    if (val == "" || val!.isEmpty) {
                                      return "This Field Can't be Null !!";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: size.height * 0.05),
                                InkWell(
                                  onTap: () async {
                                    if (_form.currentState!.validate()) {
                                      setState(() {
                                        loading = true;
                                      });
                                      final email = emailController.text.trim();
                                      final password = passwordController.text.trim();
                                      FirebaseAuthServices().signInWithPassword(
                                          context: context,
                                          email: email,
                                          password: password);
                                      setState(() {
                                        loading = false;
                                      });
                                    }

                                  },
                                  child: Container(
                                    width: size.height * 0.3,
                                    height: size.height * 0.06,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(size.height * 0.015)),
                                      color: mainColor,
                                    ),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.height * 0.025,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: size.width * 0.02),
                                Text(
                                  "OR",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: size.height * 0.02),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "SignUp",
                                      style: TextStyle(
                                          color: isDarkMode
                                              ? Colors.white
                                              : mainColor,
                                          fontSize: size.height * 0.028),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
    );
  }

  TextFormField formField({
    required Size size,
    required String label,
    required TextEditingController controller,
    required FormFieldValidator<String> validator,
    IconData? suffix,
    Function()? suffixOnPressed,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: suffixOnPressed,
          icon: Icon(
            suffix,
            color: mainColor,
          ),
        ),
        suffixIconColor: mainColor,
        contentPadding: EdgeInsets.only(
            top: 0,
            bottom: 0,
            left: size.height * 0.015,
            right: size.height * 0.015),
        label: Text(label),
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.grey,
        )),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.grey,
        )),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.grey,
        )),
        border: UnderlineInputBorder(
            borderSide: BorderSide(
          color: mainColor,
        )),
        errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.red,
        )),
      ),
    );
  }
}

import 'package:amazon/common/widgets/custom_textfild.dart';
import 'package:amazon/common/widgets/custrom_button.dart';
import 'package:amazon/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../services/auth/auth_servise.dart';

enum Auth { signin, signup }

class Authscreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const Authscreen({Key? key}) : super(key: key);

  @override
  State<Authscreen> createState() => _AuthscreenState();
}

class _AuthscreenState extends State<Authscreen> {
  Auth _auth = Auth.signin;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyBackgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
            ),
            ListTile(
              tileColor: _auth == Auth.signup
                  ? AppColor.backgroundColor
                  : AppColor.greyBackgroundColor,
              title: const Text(
                "Create Account",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              leading: Radio(
                  activeColor: AppColor.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      _auth = value!;
                    });
                  }),
            ),
            if (_auth == Auth.signup)
              Container(
                padding: const EdgeInsets.all(8),
                color: AppColor.backgroundColor,
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      CustomTextfild(
                        controller: _nameController,
                        hinText: 'Name',
                      ),
                      const SizedBox(height: 10),
                      CustomTextfild(
                        controller: _emailController,
                        hinText: 'Email',
                      ),
                      const SizedBox(height: 10),
                      CustomTextfild(
                        controller: _passwordController,
                        hinText: 'Password',
                      ),
                      const SizedBox(height: 10),
                      CustromButton(
                          text: 'Sign Up',
                          onPress: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              signUpUser();
                            }
                          })
                    ],
                  ),
                ),
              ),
            ListTile(
              tileColor: _auth == Auth.signin
                  ? AppColor.backgroundColor
                  : AppColor.greyBackgroundColor,
              title: const Text(
                "Sign-In.",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              leading: Radio(
                  activeColor: AppColor.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      _auth = value!;
                    });
                  }),
            ),
            if (_auth == Auth.signin)
              Container(
                padding: const EdgeInsets.all(8),
                color: AppColor.backgroundColor,
                child: Form(
                  key: _signInFormKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      CustomTextfild(
                        controller: _emailController,
                        hinText: 'Email',
                      ),
                      const SizedBox(height: 10),
                      CustomTextfild(
                        controller: _passwordController,
                        hinText: 'Password',
                      ),
                      const SizedBox(height: 10),
                      CustromButton(
                          text: 'Sign In',
                          onPress: () {
                            if (_signInFormKey.currentState!.validate()) {
                              signInUser();
                            }
                          })
                    ],
                  ),
                ),
              ),
          ],
        ),
      )),
    );
  }
}

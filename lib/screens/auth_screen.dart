import 'package:amazon/common/widgets/custom_textfild.dart';
import 'package:amazon/utils/app_colors.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class Authscreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const Authscreen({Key? key}) : super(key: key);

  @override
  State<Authscreen> createState() => _AuthscreenState();
}

class _AuthscreenState extends State<Authscreen> {
  Auth _auth = Auth.signin;
  final GlobalKey _signUpFormKey = GlobalKey<FormState>();
  final GlobalKey _signInFormKey = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyBackgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              'Welcome',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
            ),
            ListTile(
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
              Form(
                key: _signUpFormKey,
                child: Column(
                  children: [
                    CustomTextfild(
                      controller: _nameController,
                      hinText: 'Name',
                    ),
                    CustomTextfild(
                      controller: _emailController,
                      hinText: 'Email',
                    ),
                    CustomTextfild(
                      controller: _passwordController,
                      hinText: 'Password',
                    ),
                  ],
                ),
              ),
            ListTile(
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
            )
          ],
        ),
      )),
    );
  }
}

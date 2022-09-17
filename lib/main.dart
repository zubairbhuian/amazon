import 'package:amazon/router.dart';
import 'package:amazon/screens/auth_screen.dart';
import 'package:amazon/screens/test_screen.dart';
import 'package:amazon/utils/app_colors.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Amazon',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.backgroundColor,
          colorScheme:
              const ColorScheme.light(primary: AppColor.secondaryColor),
          appBarTheme: const AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
        ),
        onGenerateRoute: ((settings) => generateRoute(settings)),
        home: const Authscreen(),
      );
}
//  
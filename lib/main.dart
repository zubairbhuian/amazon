import 'package:amazon/router.dart';
import 'package:amazon/screens/auth_screen.dart';
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

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('My App')),
//       body: Center(child: Builder(builder: (context) {
//         return ElevatedButton(
//             onPressed: () {
//               Navigator.pushNamed(context, Authscreen.routeName);
//             },
//             child: const Text("Click Me"));
//       })),
//     );
//   }
// }

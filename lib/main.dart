import 'package:flutter/material.dart';
import 'package:gestivity/src/login/controller/login_controller.dart';
import 'package:gestivity/src/login/ui/login_page.dart';
import 'package:gestivity/src/task/controller/task_controller.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TaskController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gestivity App',
        home: const LoginPage(),
        theme: ThemeData(
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: Colors.white),
          inputDecorationTheme: const InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

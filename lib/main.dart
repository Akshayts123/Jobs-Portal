import 'package:flutter/material.dart';
import 'package:job_portal/config/routes/routes.dart';
import 'package:job_portal/screens/guideScreen/guide_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: child,
        );
      },
      debugShowCheckedModeBanner: false,
      initialRoute: GuideScreen.routeName,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

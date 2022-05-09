import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      title: "FLutter demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      supportedLocales: [const Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
    ); /*MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Modular.initialRoute,
      debugShowCheckedModeBanner: false,
    );*/
  }
}

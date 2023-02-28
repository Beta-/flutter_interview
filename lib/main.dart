import 'package:flutter/material.dart';
import 'package:flutter_interview/provider/user_provider.dart';

// Page imports
import 'package:flutter_interview/ui/pages/index.dart' as pages;
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        "/": (context) =>
            const pages.UserSelectionPage(), /**USER SELECT HERE */
      },
    );
  }
}

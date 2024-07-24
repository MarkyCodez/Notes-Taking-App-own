import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_01/models/persona.dart';
import 'package:todo_app_01/models/recent.dart';
import 'package:todo_app_01/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter<Persona>(PersonaAdapter());
  runApp(
    ChangeNotifierProvider(
      create: (context) => Recent(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(59, 125, 255, 1),
          onPrimary: const Color.fromRGBO(77, 78, 79, 1),
          secondary: const Color.fromRGBO(59, 125, 255, 1),
        ),
        primaryColor: const Color.fromRGBO(255, 255, 255, 1),
        fontFamily: "Poppins",
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(77, 78, 79, 1),
          ),
          bodyMedium: TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(77, 78, 79, 1),
          ),
          bodySmall: TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(77, 78, 79, 1),
          ),
        ),
      ),
      title: 'Flutter Demo',
      home: const HomePage(),
    );
  }
}

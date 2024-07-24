import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app_01/box/boxes.dart';
import 'package:todo_app_01/components/home_page_lower.dart';
import 'package:todo_app_01/components/home_page_upper.dart';
import 'package:todo_app_01/models/persona.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    openBoxes();
    super.initState();
  }

  Future<void> openBoxes() async {
    personalBox = await Hive.openBox<Persona>("personalbox");
    studyBox = await Hive.openBox<Persona>("studybox");
    workBox = await Hive.openBox<Persona>("workbox");
    travelBox = await Hive.openBox<Persona>("travelbox");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: const Column(
        children: [
          SizedBox(
            height: 20,
          ),
          HomePageUpper(),
          HomePageLower(),
        ],
      ),
    );
  }
}

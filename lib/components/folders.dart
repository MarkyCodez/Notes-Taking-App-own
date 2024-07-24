import 'package:flutter/material.dart';
import 'package:todo_app_01/note_adding_pages/add_note_page..dart';
import 'package:todo_app_01/note_adding_pages/add_note_study.dart';
import 'package:todo_app_01/note_adding_pages/add_note_travel.dart';
import 'package:todo_app_01/note_adding_pages/add_note_work.dart';

// ignore: must_be_immutable
class Folders extends StatelessWidget {
  Folders({super.key});

  List<String> titles = const ["Personal", "Work", "Study", "Travel"];

  List<Color> colors = [
    Colors.black,
    Colors.green,
    const Color.fromARGB(255, 255, 1, 170),
    const Color.fromARGB(255, 174, 0, 255)
  ];

  List<IconData> icons = [
    Icons.person_3,
    Icons.book,
    Icons.work,
    Icons.travel_explore
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: titles.length,
        itemBuilder: (context, index) {
          final String title = titles[index];
          final IconData icon = icons[index];
          final Color color = colors[index];
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        if (index == 0) {
                          return AddNotePage(
                            category_01: title,
                          );
                        } else if (index == 1) {
                          return AddNoteWork(
                            category_01: title,
                          );
                        } else if (index == 2) {
                          return AddNoteStudy(
                            category_01: title,
                          );
                        } else {
                          return AddNoteTravel(
                            category_01: title,
                          );
                        }
                      },
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    width: 90,
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Icon(
                            icon,
                            size: 33,
                            color: color,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                title,
              ),
            ],
          );
        },
      ),
    );
  }
}

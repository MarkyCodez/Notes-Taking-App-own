import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_01/box/boxes.dart';
import 'package:todo_app_01/models/persona.dart';
import 'package:todo_app_01/models/recent.dart';
import 'package:todo_app_01/note_getting_pages/view_note_travel.dart';

class AddNoteTravel extends StatefulWidget {
  final String category_01;
  const AddNoteTravel({
    super.key,
    required this.category_01,
  });

  @override
  State<AddNoteTravel> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNoteTravel> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _noteController = TextEditingController();

  late Box<dynamic> _travel;

  @override
  void initState() {
    setState(() {
      _travel = travelBox;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 25,
          ),
        ),
        title: Text(
          "Add New Note",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
                fontSize: 24,
              ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 0,
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: Colors.white,
              ),
              child: TextField(
                controller: _titleController,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                style: Theme.of(context).textTheme.bodySmall,
                decoration: const InputDecoration(
                  hintText: "Enter note title",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: Colors.white,
              ),
              child: TextField(
                controller: _noteController,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                maxLength: 180,
                maxLines: 20,
                style: Theme.of(context).textTheme.bodySmall,
                decoration: const InputDecoration(
                  hintText: "Start typing here...",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty &&
                    _noteController.text.isNotEmpty) {
                  setState(() {});
                  _travel.put(
                    "key",
                    Persona(
                      taskTitle: _titleController.text,
                      taskDescription: _noteController.text,
                      dateTime: DateTime.now(),
                      isCompleted: true,
                    ),
                  );
                  Provider.of<Recent>(context, listen: false).addTasks(
                    Persona(
                      taskTitle: _titleController.text,
                      taskDescription: _noteController.text,
                      dateTime: DateTime.now(),
                      isCompleted: true,
                    ),
                  );
 Provider.of<Recent>(context, listen: false)
                      .addCategory("Travel");
                  _titleController.clear();
                  _noteController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Task added successfully",
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Please enter the fields.",
                      ),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                fixedSize: Size(
                  MediaQuery.sizeOf(context).width * 0.90,
                  55,
                ),
              ),
              child: Text(
                "Add Notes to  ${widget.category_01}",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18,
                    ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ViewNoteTravel();
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                fixedSize: Size(
                  MediaQuery.sizeOf(context).width * 0.90,
                  55,
                ),
              ),
              child: Text(
                "View Notes in ${widget.category_01}",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 18,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

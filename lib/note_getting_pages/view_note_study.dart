import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app_01/box/boxes.dart';
import 'package:todo_app_01/entities/notes_list.dart';
import 'package:todo_app_01/models/persona.dart';
import 'package:todo_app_01/openiing_notes/open_study.dart';

class ViewNoteStudy extends StatefulWidget {
  const ViewNoteStudy({
    super.key,
  });

  @override
  State<ViewNoteStudy> createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNoteStudy> {
  late Box<dynamic> _study_01;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _updatedTitle = TextEditingController();
  final TextEditingController _updatedNote = TextEditingController();

  @override
  void initState() {
    _study_01 = studyBox;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            size: 25,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Study Notes",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 24,
                color: Colors.white,
              ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _study_01.length,
          itemBuilder: (context, index) {
            Persona study = _study_01.getAt(index);
            return GestureDetector(
              onLongPress: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: 200,
                      child: Wrap(
                        spacing: 16,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            onTap: () {
                              setState(() {
                                _study_01.deleteAt(index);
                              });
                              Navigator.pop(context);
                            },
                            leading: const Icon(
                              Icons.delete,
                            ),
                            title: const Text(
                              "Delete",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: SizedBox(
                                      height: 174,
                                      child: Form(
                                        key: _formKey,
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return "Please enter title.";
                                                }
                                                return null;
                                              },
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                              controller: _updatedTitle,
                                              decoration: const InputDecoration(
                                                hintText: "updated title",
                                                hintStyle: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextFormField(
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return "Please enter note.";
                                                }
                                                return null;
                                              },
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                              controller: _updatedNote,
                                              decoration: const InputDecoration(
                                                hintText: "updated note",
                                                hintStyle: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              _study_01.deleteAt(index);
                                              _study_01.put(
                                                "key_${_updatedTitle.text}",
                                                Persona(
                                                  taskTitle: _updatedTitle.text,
                                                  taskDescription:
                                                      _updatedNote.text,
                                                  dateTime: DateTime.now(),
                                                  isCompleted: true,
                                                ),
                                              );
                                            });
                                            _updatedTitle.clear();
                                            _updatedNote.clear();
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          }
                                        },
                                        child: const Text("Update"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Cancel"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            leading: const Icon(Icons.update),
                            title: const Text(
                              "Update",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const ListTile(
                            leading: Icon(Icons.share),
                            title: Text(
                              "Share",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return OpenStudy(
                        title_01: study.taskTitle,
                        note_01: study.taskDescription,
                        time_01: study.dateTime,
                      );
                    },
                  ),
                );
              },
              child: NotesList(
                date:
                    "${study.dateTime.year}-${study.dateTime.month}-${study.dateTime.day}",
                time: "${study.dateTime.hour}:${study.dateTime.minute}",
                title: study.taskTitle,
                task: study.taskDescription,
              ),
            );
          },
        ),
      ),
    );
  }
}

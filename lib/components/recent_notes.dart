import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_01/models/persona.dart';
import 'package:todo_app_01/models/recent.dart';
import 'package:todo_app_01/openiing_notes/recent_opening.dart';

class RecentNotes extends StatefulWidget {
  const RecentNotes({super.key});

  @override
  State<RecentNotes> createState() => _RecentNotesState();
}

class _RecentNotesState extends State<RecentNotes> {
  @override
  Widget build(BuildContext context) {
    final List<Persona> l2 = Provider.of<Recent>(context).l1;
    final List<String> l5 = Provider.of<Recent>(context).l4;
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: l2.length,
      itemBuilder: (context, index) {
        final Persona l3 = l2[index];
        final String cat = l5[index];
        return GestureDetector(
          onLongPress: () {
            Provider.of<Recent>(
              context,
              listen: false,
            ).removeTasks(
              l3,
            );
            Provider.of<Recent>(
              context,
              listen: false,
            ).removeCategory(
              cat,
            );
          },
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return RecentOpening(
                    title_01: l3.taskTitle,
                    note_01: l3.taskDescription,
                    time_01: l3.dateTime,
                  );
                },
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${l3.dateTime.year}-${l3.dateTime.month}-${l3.dateTime.day}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        cat,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                    Text(
                      "${l3.dateTime.hour}:${l3.dateTime.minute}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l3.taskTitle,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                    ),
                  ],
                ),
                Text(
                  l3.taskDescription,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

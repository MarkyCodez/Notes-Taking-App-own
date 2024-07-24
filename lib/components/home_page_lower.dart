import 'package:flutter/material.dart';
import 'package:todo_app_01/components/folders.dart';
import 'package:todo_app_01/components/recent_notes.dart';

class HomePageLower extends StatelessWidget {
  const HomePageLower({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: Theme.of(context).primaryColor,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Folders",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              Folders(),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Recent Notes",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const RecentNotes(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NotesList extends StatelessWidget {
  final String date;
  final String time;
  final String title;
  final String task;
  const NotesList({
    super.key,
    required this.date,
    required this.time,
    required this.title,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                time,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 28,
                    ),
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
              ),
            ],
          ),
          SizedBox(
            height: 30,
            child: Text(
              task,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

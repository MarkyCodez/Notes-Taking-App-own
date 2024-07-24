import 'package:flutter/material.dart';
import 'package:todo_app_01/models/persona.dart';

class Recent extends ChangeNotifier {
  List<Persona> l1 = [];
  List<String> l4 = [];

  addTasks(Persona per) {
    l1.add(per);
    notifyListeners();
  }

  removeTasks(Persona per) {
    l1.remove(per);
    notifyListeners();
  }

  addCategory(String category) {
    l4.add(category);
    notifyListeners();
  }

  removeCategory(String category) {
    l4.remove(category);
    notifyListeners();
  }
}

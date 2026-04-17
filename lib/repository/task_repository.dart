import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ui_class/models/task_model.dart';

class TaskRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final String collection = "tasks";

  // GET TASKS (REAL TIME)
  Stream<List<TaskModel>> getTasks() {
    return _firestore.collection(collection).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return TaskModel.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  // ADD TASK
  Future<void> addTask(TaskModel task) async {
    await _firestore.collection(collection).add(task.toMap());
  }

  // DELETE TASK (IMPORTANT FIX HERE)
  Future<void> deleteTask(String id) async {
    if (id.isEmpty) return;

    await _firestore.collection(collection).doc(id).delete();
  }
}

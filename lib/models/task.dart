class Task {
  final String name;
  bool isDone;
  bool delete;

  Task({required this.name, this.isDone = false, this.delete = false});

  void toggleDone() {
    isDone = !isDone;
  }
}

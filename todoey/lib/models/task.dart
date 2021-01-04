class Task {
  final String name;
  bool isDone;

  Task({this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }

  @override
  String toString() {
    return 'Task: $name isDone $isDone';
  }
}

import 'package:everyday/models/task_data.dart';
import 'package:everyday/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              isChecked: task.isDone,
              taskTitle: task.name,
              checkboxCallback: (bool? checkboxState) {
                taskData.updateTask(task);
              },
              onLongpressCallback: () {
                Alert(
                  context: context,
                  style: AlertStyle(
                    animationType: AnimationType.shrink,
                    isCloseButton: false,
                    descStyle: const TextStyle(fontWeight: FontWeight.bold),
                    descTextAlign: TextAlign.start,
                    animationDuration: const Duration(milliseconds: 800),
                    alertBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    titleStyle: const TextStyle(
                      color: Colors.red,
                    ),
                    alertAlignment: Alignment.center,
                  ),
                  type: AlertType.warning,
                  title: "Delete Task ?",
                  desc: "Once you hit delete, it is inevitable.",
                  buttons: [
                    DialogButton(
                      child: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        taskData.deleteTask(task);
                        Navigator.pop(context);
                      },
                      color: const Color.fromRGBO(227, 9, 59, 1.0),
                    ),
                    DialogButton(
                      child: const Text(
                        "Keep",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      gradient: const LinearGradient(colors: [
                        Color.fromRGBO(6, 215, 64, 1.0),
                        Color.fromRGBO(52, 138, 199, 1.0)
                      ]),
                    )
                  ],
                ).show();
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

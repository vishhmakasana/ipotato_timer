import 'package:flutter/material.dart';
import 'package:ipotato_timer/presentation/ui/dialogs/add_task_dialog.dart';

class AddTaskFloatingButton extends StatelessWidget {
  const AddTaskFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      onPressed: () {
        showAddTaskDialog(context: context);
      },
      label: const Text('New Task'),
      icon: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
    );
  }
}

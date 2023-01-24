import 'package:flutter/material.dart';
import 'package:ipotato_timer/presentation/ui/pages/add_task_view.dart';

final controller = TextEditingController();

Future<bool?> showAddTaskDialog({
  required BuildContext context,
}) {
  controller.clear();
  return showDialog<bool?>(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          'Add Task',
          style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 46),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(24.0),
          ),
        ),
        insetPadding: const EdgeInsets.all(24),
        contentPadding: EdgeInsets.zero,
        content: const AddTaskView(),
      );
    },
  );
}

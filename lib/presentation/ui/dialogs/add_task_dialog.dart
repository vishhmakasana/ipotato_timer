import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/presentation/states/home_state.dart';
import 'package:ipotato_timer/presentation/theme/text_input.dart';
import 'package:ipotato_timer/presentation/ui/components/duration_input.dart';

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
          style: Theme.of(context).textTheme.headline1,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(24.0),
          ),
        ),
        insetPadding: const EdgeInsets.all(24),
        contentPadding: EdgeInsets.zero,
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: inputBorder,
                    hintText: 'Enter task title',
                    labelText: 'Title',
                    hintStyle: getHintTextStyle(context: context),
                    labelStyle: getHintTextStyle(context: context),
                    floatingLabelStyle: getHintTextStyle(
                        context: context,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  minLines: 3,
                  maxLines: 3,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    border: inputBorder,
                    hintText: 'Enter task description',
                    labelText: 'Description',
                    alignLabelWithHint: true,
                    hintStyle: getHintTextStyle(context: context),
                    labelStyle: getHintTextStyle(context: context),
                    floatingLabelStyle: getHintTextStyle(
                        context: context,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: Text(
                  'Duration',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              const DurationInput(),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextButton(
                  onPressed: () {
                    // adding task for testing
                    GetIt.I.get<HomeState>().addTask(
                          title: 'title',
                          description: 'description',
                          taskDuration: const Duration(seconds: 15),
                        );
                  },
                  style: Theme.of(context).textButtonTheme.style,
                  child: const Text('Add Task'),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

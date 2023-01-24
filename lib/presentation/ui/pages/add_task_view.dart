import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipotato_timer/presentation/states/add_task_form_state.dart';
import 'package:ipotato_timer/presentation/theme/text_input.dart';
import 'package:ipotato_timer/presentation/ui/components/duration_input.dart';
import 'package:provider/provider.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  final AddTaskState addTaskState = AddTaskState();

  @override
  void initState() {
    super.initState();
    addTaskState.setupValidations();
  }

  @override
  void dispose() {
    addTaskState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => addTaskState,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Observer(builder: (context) {
                        return TextField(
                          onChanged: (value) => addTaskState.title = value,
                          textInputAction: TextInputAction.next,
                          maxLength: 50,
                          decoration: InputDecoration(
                            border: inputBorder,
                            hintText: 'Enter task title',
                            labelText: 'Title',
                            errorText: addTaskState.error.title,
                            errorStyle: getErrorTextStyle(context: context),
                            hintStyle: getHintTextStyle(context: context),
                            labelStyle: getHintTextStyle(context: context),
                            floatingLabelStyle: getHintTextStyle(
                                context: context,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Observer(builder: (context) {
                        return TextField(
                          minLines: 3,
                          maxLines: 3,
                          maxLength: 300,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) =>
                              addTaskState.description = value,
                          textAlignVertical: TextAlignVertical.top,
                          decoration: InputDecoration(
                            border: inputBorder,
                            hintText: 'Enter task description',
                            labelText: 'Description',
                            errorText: addTaskState.error.description,
                            alignLabelWithHint: true,
                            errorStyle: getErrorTextStyle(context: context),
                            hintStyle: getHintTextStyle(context: context),
                            labelStyle: getHintTextStyle(context: context),
                            floatingLabelStyle: getHintTextStyle(
                                context: context,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 16),
                      child: Text(
                        'Duration',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    DurationInput(
                      onSubmit: () {
                        addTask(context);
                      },
                    ),
                    Observer(builder: (context) {
                      return addTaskState.error.duration != null
                          ? Padding(
                              padding: const EdgeInsets.only(left: 24.0),
                              child: Text(
                                addTaskState.error.duration!,
                                style: getErrorTextStyle(context: context),
                              ),
                            )
                          : const SizedBox();
                    }),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  addTask(context);
                },
                style: Theme.of(context).textButtonTheme.style!.copyWith(
                      shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                          ),
                        ),
                      ),
                    ),
                child: const Text('Add Task'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void addTask(BuildContext context) async {
    final result = await addTaskState.validateAll();
    if (result && mounted) {
      Navigator.of(context).pop();
    }
  }
}

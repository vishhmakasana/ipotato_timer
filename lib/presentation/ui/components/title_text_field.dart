import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipotato_timer/presentation/states/add_task_form_state.dart';
import 'package:ipotato_timer/presentation/theme/text_input.dart';
import 'package:provider/provider.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addTaskState = context.read<AddTaskState>();
    return Padding(
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
                context: context, color: Theme.of(context).colorScheme.primary),
          ),
        );
      }),
    );
  }
}

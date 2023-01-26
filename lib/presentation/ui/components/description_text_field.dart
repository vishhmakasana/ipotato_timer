import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipotato_timer/presentation/states/add_task_form_state.dart';
import 'package:ipotato_timer/presentation/theme/text_input.dart';
import 'package:provider/provider.dart';

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addTaskState = context.read<AddTaskState>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Observer(builder: (context) {
        return TextField(
          key: const ValueKey('text_field_description'),
          minLines: 3,
          maxLines: 3,
          maxLength: 300,
          textInputAction: TextInputAction.next,
          onChanged: (value) => addTaskState.description = value,
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
                context: context, color: Theme.of(context).colorScheme.primary),
          ),
        );
      }),
    );
  }
}

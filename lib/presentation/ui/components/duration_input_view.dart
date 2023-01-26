import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ipotato_timer/presentation/states/add_task_form_state.dart';
import 'package:ipotato_timer/presentation/theme/text_input.dart';
import 'package:provider/provider.dart';

class DurationInputView extends StatelessWidget {
  final void Function() onSubmit;

  const DurationInputView({Key? key, required this.onSubmit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addTaskState = context.read<AddTaskState>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      TextField(
                        key: const ValueKey('text_field_hour'),
                        textInputAction: TextInputAction.next,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) =>
                            addTaskState.durationHours = value,
                        maxLength: 2,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displaySmall!,
                        decoration: getInputBorderDuration(context),
                      ),
                      Text(
                        'HH',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
                Text(
                  ' : ',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Flexible(
                  child: Center(
                    child: Column(
                      children: [
                        TextField(
                          key: const ValueKey('text_field_minute'),
                          textInputAction: TextInputAction.next,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (value) =>
                              addTaskState.durationMinutes = value,
                          maxLength: 2,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displaySmall!,
                          decoration: getInputBorderDuration(context),
                        ),
                        Text(
                          'MM',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  ' : ',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Flexible(
                  child: Column(
                    children: [
                      TextField(
                        key: const ValueKey('text_field_second'),
                        onSubmitted: (value) async {
                          onSubmit();
                        },
                        textInputAction: TextInputAction.done,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) =>
                            addTaskState.durationSeconds = value,
                        maxLength: 2,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displaySmall!,
                        decoration: getInputBorderDuration(context),
                      ),
                      Text(
                        'SS',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }
}

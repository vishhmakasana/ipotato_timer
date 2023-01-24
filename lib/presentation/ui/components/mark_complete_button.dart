import 'package:flutter/material.dart';
import 'package:ipotato_timer/domain/entities/task_entity.dart';
import 'package:ipotato_timer/presentation/states/home_state.dart';
import 'package:provider/provider.dart';

class MarkCompleteButton extends StatelessWidget {
  final TaskId taskId;

  const MarkCompleteButton({Key? key, this.taskId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeState = context.read<HomeState>();
    return TextButton(
      key: const ValueKey('btn_mark_complete'),
      onPressed: () {
        homeState.deleteTask(taskId: taskId);
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
      child: const Text('MARK COMPLETE'),
    );
  }
}

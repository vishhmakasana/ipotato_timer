import 'package:flutter/material.dart';
import 'package:ipotato_timer/gen/assets.gen.dart';
import 'package:ipotato_timer/presentation/extensions/extensions.dart';
import 'package:ipotato_timer/presentation/states/home_state.dart';
import 'package:ipotato_timer/presentation/states/task_state.dart';
import 'package:provider/provider.dart';

class PlayPauseButton extends StatelessWidget {
  final Task listItem;

  const PlayPauseButton({Key? key, required this.listItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeState = context.read<HomeState>();
    return InkWell(
      key: ValueKey(listItem.isPaused ? 'ic_play' : 'ic_pause'),
      child: listItem.isPaused
          ? Assets.icon.icPlayButtonSolid
              .svg(color: Theme.of(context).colorScheme.tertiary)
          : Assets.icon.icPauseButtonSolid
              .svg(color: Theme.of(context).colorScheme.tertiary),
      onTap: () {
        if (listItem.isPaused) {
          if (listItem.pausedTime != null) {
            homeState.resumeTask(
              taskId: listItem.id,
              pausedTime: listItem.pausedTime!,
              pausedDuration: listItem.pausedDuration.toDuration(),
            );
          }
        } else {
          homeState.pauseTask(taskId: listItem.id);
        }
      },
    );
  }
}

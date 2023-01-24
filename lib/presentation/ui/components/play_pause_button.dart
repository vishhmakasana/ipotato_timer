import 'package:flutter/material.dart';
import 'package:ipotato_timer/gen/assets.gen.dart';
import 'package:ipotato_timer/presentation/extensions/extensions.dart';
import 'package:ipotato_timer/presentation/states/home_state.dart';
import 'package:provider/provider.dart';

class PlayPauseButton extends StatelessWidget {
  final int index;

  const PlayPauseButton({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeState = context.read<HomeState>();
    final listItem = homeState.sortedTasks[index];
    return InkWell(
      child: listItem.isPaused
          ? Assets.icon.icPlayButtonSolid.svg()
          : Assets.icon.icPauseButtonSolid.svg(),
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

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/presentation/extensions/extensions.dart';
import 'package:ipotato_timer/presentation/states/home_state.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final homeState = GetIt.I.get<HomeState>();

    return Observer(builder: (context) {
      final listItem = homeState.sortedTasks[index];
      int seconds = 0;
      if (!listItem.isFinished && !listItem.isPaused) {
        seconds = homeState.timeElapsed;
      }
      return ListTile(
        title: Text('${listItem.title} : ${listItem.isFinished}'),
        subtitle: Text(
            '${listItem.remainingDuration} ${listItem.creationTime} -> $seconds '),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            homeState.deleteTask(taskId: listItem.id);
          },
        ),
        leading: !listItem.isFinished
            ? IconButton(
                icon: Icon(
                    listItem.isPaused ? Icons.play_circle : Icons.pause_circle),
                onPressed: () {
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
              )
            : null,
      );
    });
  }
}

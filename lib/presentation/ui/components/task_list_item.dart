import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/gen/assets.gen.dart';
import 'package:ipotato_timer/presentation/states/home_state.dart';
import 'package:ipotato_timer/presentation/states/task_state.dart';
import 'package:ipotato_timer/presentation/ui/components/finished_title_view.dart';
import 'package:ipotato_timer/presentation/ui/components/mark_complete_button.dart';
import 'package:ipotato_timer/presentation/ui/components/play_pause_button.dart';
import 'package:ipotato_timer/presentation/ui/components/remaining_duration_text_view.dart';
import 'package:provider/provider.dart';

class TaskListItem extends StatelessWidget {

  const TaskListItem({
    Key? key,
    required this.listItem,
  }) : super(key: key);

  final Task listItem;

  @override
  Widget build(BuildContext context) {
    final homeState = GetIt.I.get<HomeState>();

    return Observer(builder: (context) {
      // Used to listen for the time update
      //ignore: unused_local_variable
      int seconds = 0;
      if (!listItem.isFinished && !listItem.isPaused) {
        seconds = homeState.timeElapsed;
      }
      return Dismissible(
        onDismissed: (_) {
          homeState.deleteTask(taskId: listItem.id);
        },
        background: Container(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        direction: listItem.isFinished
            ? DismissDirection.horizontal
            : DismissDirection.none,
        key: ValueKey(listItem.id),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 24,
            ),
            child: Provider(
              create: (_) => homeState,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (listItem.isFinished) const FinishedTitleView(),
                  if (!listItem.isFinished)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RemainingDurationTextView(
                          duration: listItem.remainingDuration,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        PlayPauseButton(listItem: listItem),
                        const SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          key: const ValueKey('ic_stop'),
                          child: Assets.icon.icStopButtonSolid.svg(
                              color: Theme.of(context).colorScheme.tertiary),
                          onTap: () {
                            homeState.deleteTask(taskId: listItem.id);
                          },
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      listItem.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24.0, right: 24, bottom: 16),
                    child: Text(
                      listItem.description,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  if (listItem.isFinished)
                    MarkCompleteButton(
                      taskId: listItem.id,
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

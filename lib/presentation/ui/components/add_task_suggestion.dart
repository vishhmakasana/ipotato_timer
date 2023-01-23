import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/gen/assets.gen.dart';
import 'package:ipotato_timer/presentation/states/home_state.dart';

class AddTaskSuggestion extends StatelessWidget {
  const AddTaskSuggestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeState = GetIt.I.get<HomeState>();
    return Observer(builder: (context) {
      if (homeState.isNoTasksFound && !homeState.isLoading) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8.0, right: 8),
                child: Text('No timers active.\nPress here to start a new one'),
              ),
              Assets.images.imgPointerDown.svg(),
            ],
          ),
        );
      }
      return const SizedBox();
    });
  }
}

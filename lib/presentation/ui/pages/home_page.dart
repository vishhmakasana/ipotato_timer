import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/core/audio/audio_service.dart';
import 'package:ipotato_timer/presentation/states/home_state.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipotato_timer/presentation/ui/components/add_task_floating_button.dart';
import 'package:ipotato_timer/presentation/ui/components/add_task_suggestion_view.dart';
import 'package:ipotato_timer/presentation/ui/components/task_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final options = const LiveOptions(
    delay: Duration(milliseconds: 200),
    showItemInterval: Duration(milliseconds: 200),
    visibleFraction: 0.05,
    reAnimateOnVisibility: false,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    GetIt.I.get<AudioService>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeState = GetIt.I.get<HomeState>()..initialize();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Potato Timer'),
      ),
      body: Observer(builder: (context) {
        if (homeState.isLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView.separated(
            padding: const EdgeInsets.only(
                bottom: kFloatingActionButtonMargin + 72, top: 16),
            itemBuilder: (context, index) {
              return TaskListItem(index: index);
            },
            itemCount: homeState.sortedTasks.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 16,
              );
            },
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: kFloatingActionButtonMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: const [
            AddTaskSuggestionView(),
            AddTaskFloatingButton(),
          ],
        ),
      ),
    );
  }
}

// not satisfied with the result
// return Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//   child: LiveList.options(
//     padding: const EdgeInsets.only(
//         bottom: kFloatingActionButtonMargin + 72, top: 16),
//     options: options,
//     itemBuilder: (
//       context,
//       index,
//       animation,
//     ) =>
//         TaskListItem(
//       index: index,
//       animation: animation,
//     ),
//     scrollDirection: Axis.vertical,
//     itemCount: homeState.sortedTasks.length,
//     separatorBuilder: (BuildContext context, int index) {
//       return const SizedBox(
//         height: 16,
//       );
//     },
//   ),
// );

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/presentation/states/home_state.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipotato_timer/presentation/ui/components/add_task_floating_button.dart';
import 'package:ipotato_timer/presentation/ui/components/add_task_suggestion.dart';
import 'package:ipotato_timer/presentation/ui/components/task_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskListItem(index: index);
          },
          itemCount: homeState.sortedTasks.length,
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: const [
            AddTaskSuggestion(),
            AddTaskFloatingButton(),
          ],
        ),
      ),
    );
  }
}

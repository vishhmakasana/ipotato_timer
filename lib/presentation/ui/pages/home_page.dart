import 'package:flutter/material.dart';
import 'package:ipotato_timer/presentation/states/home_state.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipotato_timer/presentation/ui/components/add_task_floating_button.dart';
import 'package:ipotato_timer/presentation/ui/components/add_task_suggestion_view.dart';
import 'package:ipotato_timer/presentation/ui/components/task_list_item.dart';

class HomePage extends StatefulWidget {
  final HomeState homeState;

  const HomePage({Key? key, required this.homeState}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.homeState.initialize();
  }

  @override
  void dispose() async {
    super.dispose();
    await widget.homeState.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeState = widget.homeState;
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
              return TaskListItem(
                listItem: homeState.sortedTasks[index],
                key: ValueKey(
                    'task_list_item_${homeState.sortedTasks[index].id}'),
              );
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

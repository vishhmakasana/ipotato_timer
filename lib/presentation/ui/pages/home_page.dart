import 'package:flutter/material.dart';
import 'package:ipotato_timer/presentation/theme/text_input.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Potato Timer'),
      ),
      body: Column(
        // checking the design system for basic component
        children: [
          Text(
            'Title',
            style: Theme.of(context).textTheme.headline1,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                border: inputBorder,
                hintText: 'Enter task title',
                labelText: 'Title',
                hintStyle: getHintTextStyle(context: context),
                labelStyle: getHintTextStyle(context: context),
                floatingLabelStyle: getHintTextStyle(
                    context: context,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            style: Theme.of(context).textButtonTheme.style,
            child:  const Text('Add Task'),
          ),
        ],
      ),
    );
  }
}

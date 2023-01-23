import 'package:flutter/material.dart';
import 'package:ipotato_timer/presentation/theme/text_input.dart';

class DurationInput extends StatelessWidget {
  const DurationInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 48,
            child: Column(
              children: [
                TextField(
                  maxLength: 2,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: getInputBorderDuration(context),
                ),
                const Text('HH'),
              ],
            ),
          ),
          Text(
            ' : ',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          SizedBox(
            width: 48,
            child: Center(
              child: Column(
                children: [
                  TextField(
                    maxLength: 2,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: getInputBorderDuration(context),
                  ),
                  const Text('MM'),
                ],
              ),
            ),
          ),
          Text(
            ' : ',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          SizedBox(
            width: 48,
            child: Column(
              children: [
                TextField(
                  maxLength: 2,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: getInputBorderDuration(context),
                ),
                const Text('SS'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

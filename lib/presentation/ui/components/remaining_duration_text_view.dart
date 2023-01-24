import 'package:flutter/material.dart';
import 'package:ipotato_timer/presentation/extensions/extensions.dart';

class RemainingDurationTextView extends StatelessWidget {
  final int duration;

  const RemainingDurationTextView({Key? key, required this.duration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          duration.toFormattedTime(),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}

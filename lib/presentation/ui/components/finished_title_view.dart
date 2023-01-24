import 'package:flutter/material.dart';
import 'package:ipotato_timer/gen/assets.gen.dart';

class FinishedTitleView extends StatelessWidget {
  const FinishedTitleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.images.imgSoundWave.svg(),
        const SizedBox(
          width: 16,
        ),
        Text(
          'FINISHED',
          key: const ValueKey('txt_finished'),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(
          width: 16,
        ),
        Assets.images.imgSoundWave.svg(),
      ],
    );
  }
}

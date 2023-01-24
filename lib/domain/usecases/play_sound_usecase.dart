import 'package:ipotato_timer/core/audio/audio_service.dart';
import 'package:ipotato_timer/gen/assets.gen.dart';

abstract class PlaySoundUseCase {
  void playAudio();
}

class PlaySoundUseCaseImpl implements PlaySoundUseCase {
  final AudioService audioService;

  PlaySoundUseCaseImpl(this.audioService);

  @override
  void playAudio() {
    audioService.playLocalAudio(Assets.audio.soundComplete);
  }
}

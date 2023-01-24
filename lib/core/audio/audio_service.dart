import 'package:just_audio/just_audio.dart';

abstract class AudioService {
  void playLocalAudio(String audioPath);

  void pauseLocalAudio();
}

class JustAudioService implements AudioService {
  final AudioPlayer player;

  JustAudioService({required this.player});

  @override
  void pauseLocalAudio() async {
    player.pause();
  }

  @override
  void playLocalAudio(String audioPath) async {
    if (player.playing) return;
    await player.setAsset(audioPath);
    player.play();
  }
}

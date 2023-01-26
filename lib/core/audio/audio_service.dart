import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

abstract class AudioService {
  void playLocalAudio(String audioPath);

  void pauseLocalAudio();

  void dispose();
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

  @override
  void dispose() {
    player.dispose();
  }
}

class MockAudioService implements AudioService {
  @override
  void pauseLocalAudio() async {
    debugPrint('pauseLocalAudio');
  }

  @override
  void playLocalAudio(String audioPath) async {
    debugPrint('playLocalAudio');
  }

  @override
  void dispose() {
    debugPrint('audio player disposed');
  }
}

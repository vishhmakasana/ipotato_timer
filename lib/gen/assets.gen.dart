/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsAudioGen {
  const $AssetsAudioGen();

  /// File path: assets/audio/sound_complete.mp3
  String get soundComplete => 'assets/audio/sound_complete.mp3';

  /// List of all assets
  List<String> get values => [soundComplete];
}

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/ic_app_icon.png
  AssetGenImage get icAppIcon =>
      const AssetGenImage('assets/icon/ic_app_icon.png');

  /// File path: assets/icon/ic_pause_button_solid.svg
  SvgGenImage get icPauseButtonSolid =>
      const SvgGenImage('assets/icon/ic_pause_button_solid.svg');

  /// File path: assets/icon/ic_play_button_solid.svg
  SvgGenImage get icPlayButtonSolid =>
      const SvgGenImage('assets/icon/ic_play_button_solid.svg');

  /// File path: assets/icon/ic_stop_button_solid.svg
  SvgGenImage get icStopButtonSolid =>
      const SvgGenImage('assets/icon/ic_stop_button_solid.svg');

  /// List of all assets
  List<dynamic> get values =>
      [icAppIcon, icPauseButtonSolid, icPlayButtonSolid, icStopButtonSolid];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/img_pointer_down.svg
  SvgGenImage get imgPointerDown =>
      const SvgGenImage('assets/images/img_pointer_down.svg');

  /// File path: assets/images/img_sound_wave.svg
  SvgGenImage get imgSoundWave =>
      const SvgGenImage('assets/images/img_sound_wave.svg');

  /// List of all assets
  List<SvgGenImage> get values => [imgPointerDown, imgSoundWave];
}

class Assets {
  Assets._();

  static const $AssetsAudioGen audio = $AssetsAudioGen();
  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

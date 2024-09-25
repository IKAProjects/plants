/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/bottom.png
  AssetGenImage get bottom => const AssetGenImage('assets/png/bottom.png');

  /// File path: assets/png/container.png
  AssetGenImage get container =>
      const AssetGenImage('assets/png/container.png');

  /// File path: assets/png/empty_box.png
  AssetGenImage get emptyBox => const AssetGenImage('assets/png/empty_box.png');

  /// File path: assets/png/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/png/logo.png');

  /// File path: assets/png/onb1.png
  AssetGenImage get onb1 => const AssetGenImage('assets/png/onb1.png');

  /// File path: assets/png/onb2.png
  AssetGenImage get onb2 => const AssetGenImage('assets/png/onb2.png');

  /// File path: assets/png/onb3.png
  AssetGenImage get onb3 => const AssetGenImage('assets/png/onb3.png');

  /// File path: assets/png/plant.png
  AssetGenImage get plant => const AssetGenImage('assets/png/plant.png');

  /// File path: assets/png/plant_img.png
  AssetGenImage get plantImg => const AssetGenImage('assets/png/plant_img.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [bottom, container, emptyBox, logo, onb1, onb2, onb3, plant, plantImg];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/arrow_back.svg
  String get arrowBack => 'assets/svg/arrow_back.svg';

  /// File path: assets/svg/arrow_down.svg
  String get arrowDown => 'assets/svg/arrow_down.svg';

  /// File path: assets/svg/arrow_right.svg
  String get arrowRight => 'assets/svg/arrow_right.svg';

  /// File path: assets/svg/arrow_up.svg
  String get arrowUp => 'assets/svg/arrow_up.svg';

  /// File path: assets/svg/bottom_icon.svg
  String get bottomIcon => 'assets/svg/bottom_icon.svg';

  /// File path: assets/svg/dots.svg
  String get dots => 'assets/svg/dots.svg';

  /// File path: assets/svg/facts.svg
  String get facts => 'assets/svg/facts.svg';

  /// File path: assets/svg/heart.svg
  String get heart => 'assets/svg/heart.svg';

  /// File path: assets/svg/heart_filled.svg
  String get heartFilled => 'assets/svg/heart_filled.svg';

  /// File path: assets/svg/home.svg
  String get home => 'assets/svg/home.svg';

  /// File path: assets/svg/plus.svg
  String get plus => 'assets/svg/plus.svg';

  /// File path: assets/svg/settings.svg
  String get settings => 'assets/svg/settings.svg';

  /// File path: assets/svg/tips.svg
  String get tips => 'assets/svg/tips.svg';

  /// List of all assets
  List<String> get values => [
        arrowBack,
        arrowDown,
        arrowRight,
        arrowUp,
        bottomIcon,
        dots,
        facts,
        heart,
        heartFilled,
        home,
        plus,
        settings,
        tips
      ];
}

class Assets {
  Assets._();

  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

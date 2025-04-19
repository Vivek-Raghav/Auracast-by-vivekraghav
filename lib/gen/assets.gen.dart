/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/app_icon.jpeg
  AssetGenImage get appIconJpeg =>
      const AssetGenImage('assets/icons/app_icon.jpeg');

  /// File path: assets/icons/app_icon.png
  AssetGenImage get appIconPng =>
      const AssetGenImage('assets/icons/app_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [appIconJpeg, appIconPng];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/home_background.png
  AssetGenImage get homeBackground =>
      const AssetGenImage('assets/images/home_background.png');

  /// File path: assets/images/house.png
  AssetGenImage get house => const AssetGenImage('assets/images/house.png');

  /// List of all assets
  List<AssetGenImage> get values => [homeBackground, house];
}

class $AssetsWeathertypeGen {
  const $AssetsWeathertypeGen();

  /// File path: assets/weathertype/Ash.jpg
  AssetGenImage get ash => const AssetGenImage('assets/weathertype/Ash.jpg');

  /// File path: assets/weathertype/clear.jpg
  AssetGenImage get clear =>
      const AssetGenImage('assets/weathertype/clear.jpg');

  /// File path: assets/weathertype/clouds.jpg
  AssetGenImage get clouds =>
      const AssetGenImage('assets/weathertype/clouds.jpg');

  /// File path: assets/weathertype/drizzle.png
  AssetGenImage get drizzle =>
      const AssetGenImage('assets/weathertype/drizzle.png');

  /// File path: assets/weathertype/dust.png
  AssetGenImage get dust => const AssetGenImage('assets/weathertype/dust.png');

  /// File path: assets/weathertype/fog.jpg
  AssetGenImage get fog => const AssetGenImage('assets/weathertype/fog.jpg');

  /// File path: assets/weathertype/haze.png
  AssetGenImage get haze => const AssetGenImage('assets/weathertype/haze.png');

  /// File path: assets/weathertype/mist.png
  AssetGenImage get mist => const AssetGenImage('assets/weathertype/mist.png');

  /// File path: assets/weathertype/night.jpg
  AssetGenImage get night =>
      const AssetGenImage('assets/weathertype/night.jpg');

  /// File path: assets/weathertype/rain.png
  AssetGenImage get rain => const AssetGenImage('assets/weathertype/rain.png');

  /// File path: assets/weathertype/sand.jpg
  AssetGenImage get sand => const AssetGenImage('assets/weathertype/sand.jpg');

  /// File path: assets/weathertype/smoke.jpg
  AssetGenImage get smoke =>
      const AssetGenImage('assets/weathertype/smoke.jpg');

  /// File path: assets/weathertype/snow.png
  AssetGenImage get snow => const AssetGenImage('assets/weathertype/snow.png');

  /// File path: assets/weathertype/squall.jpg
  AssetGenImage get squall =>
      const AssetGenImage('assets/weathertype/squall.jpg');

  /// File path: assets/weathertype/thunderstorm.jpg
  AssetGenImage get thunderstorm =>
      const AssetGenImage('assets/weathertype/thunderstorm.jpg');

  /// File path: assets/weathertype/tornado.jpg
  AssetGenImage get tornado =>
      const AssetGenImage('assets/weathertype/tornado.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        ash,
        clear,
        clouds,
        drizzle,
        dust,
        fog,
        haze,
        mist,
        night,
        rain,
        sand,
        smoke,
        snow,
        squall,
        thunderstorm,
        tornado
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsWeathertypeGen weathertype = $AssetsWeathertypeGen();
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

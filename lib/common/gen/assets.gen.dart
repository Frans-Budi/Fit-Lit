/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic-about-us.svg
  SvgGenImage get icAboutUs =>
      const SvgGenImage('assets/icons/ic-about-us.svg');

  /// File path: assets/icons/ic-arrow-right.svg
  SvgGenImage get icArrowRight =>
      const SvgGenImage('assets/icons/ic-arrow-right.svg');

  /// File path: assets/icons/ic-check.svg
  SvgGenImage get icCheck => const SvgGenImage('assets/icons/ic-check.svg');

  /// File path: assets/icons/ic-edit-profile.svg
  SvgGenImage get icEditProfile =>
      const SvgGenImage('assets/icons/ic-edit-profile.svg');

  /// File path: assets/icons/ic-faq.svg
  SvgGenImage get icFaq => const SvgGenImage('assets/icons/ic-faq.svg');

  /// File path: assets/icons/ic-info.svg
  SvgGenImage get icInfo => const SvgGenImage('assets/icons/ic-info.svg');

  /// File path: assets/icons/ic-logout.svg
  SvgGenImage get icLogout => const SvgGenImage('assets/icons/ic-logout.svg');

  /// File path: assets/icons/ic-question.svg
  SvgGenImage get icQuestion =>
      const SvgGenImage('assets/icons/ic-question.svg');

  /// File path: assets/icons/ic-safety.svg
  SvgGenImage get icSafety => const SvgGenImage('assets/icons/ic-safety.svg');

  /// File path: assets/icons/ic-success.svg
  SvgGenImage get icSuccess => const SvgGenImage('assets/icons/ic-success.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        icAboutUs,
        icArrowRight,
        icCheck,
        icEditProfile,
        icFaq,
        icInfo,
        icLogout,
        icQuestion,
        icSafety,
        icSuccess
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/empty_person.jpeg
  AssetGenImage get emptyPerson =>
      const AssetGenImage('assets/images/empty_person.jpeg');

  /// File path: assets/images/no-image-red.png
  AssetGenImage get noImageRed =>
      const AssetGenImage('assets/images/no-image-red.png');

  /// File path: assets/images/no-image.png
  AssetGenImage get noImage =>
      const AssetGenImage('assets/images/no-image.png');

  /// List of all assets
  List<AssetGenImage> get values => [emptyPerson, noImageRed, noImage];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/game_categories.json
  String get gameCategories => 'assets/json/game_categories.json';

  /// File path: assets/json/game_detail.json
  String get gameDetail => 'assets/json/game_detail.json';

  /// File path: assets/json/game_home.json
  String get gameHome => 'assets/json/game_home.json';

  /// File path: assets/json/games.json
  String get games => 'assets/json/games.json';

  /// File path: assets/json/playing_games.json
  String get playingGames => 'assets/json/playing_games.json';

  /// List of all assets
  List<String> get values =>
      [gameCategories, gameDetail, gameHome, games, playingGames];
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// File path: assets/logo/fitlit-hr.png
  AssetGenImage get fitlitHr =>
      const AssetGenImage('assets/logo/fitlit-hr.png');

  /// File path: assets/logo/fitlit-vr.png
  AssetGenImage get fitlitVr =>
      const AssetGenImage('assets/logo/fitlit-vr.png');

  /// List of all assets
  List<AssetGenImage> get values => [fitlitHr, fitlitVr];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
  static const $AssetsLogoGen logo = $AssetsLogoGen();
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
    bool gaplessPlayback = true,
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

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
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
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

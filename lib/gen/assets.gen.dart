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

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Iconsabtnam.svg
  SvgGenImage get iconsabtnam =>
      const SvgGenImage('assets/images/Iconsabtnam.svg');

  /// File path: assets/images/Mapping-Metaverse02.png
  AssetGenImage get mappingMetaverse02 =>
      const AssetGenImage('assets/images/Mapping-Metaverse02.png');

  /// File path: assets/images/Moonray-the-First-Bitcoin-Metaverse-Game-on-Stacks-Raises-3.5M.png
  AssetGenImage get moonrayTheFirstBitcoinMetaverseGameOnStacksRaises35M =>
      const AssetGenImage(
          'assets/images/Moonray-the-First-Bitcoin-Metaverse-Game-on-Stacks-Raises-3.5M.png');

  /// File path: assets/images/avatarIcon.png
  AssetGenImage get avatarIcon =>
      const AssetGenImage('assets/images/avatarIcon.png');

  /// File path: assets/images/felesh.svg
  SvgGenImage get felesh => const SvgGenImage('assets/images/felesh.svg');

  /// File path: assets/images/hastag.png
  AssetGenImage get hastag => const AssetGenImage('assets/images/hastag.png');

  /// File path: assets/images/homeicon.png
  AssetGenImage get homeicon =>
      const AssetGenImage('assets/images/homeicon.png');

  /// File path: assets/images/iconghalam.png
  AssetGenImage get iconghalam =>
      const AssetGenImage('assets/images/iconghalam.png');

  /// File path: assets/images/padcost_icon.png
  AssetGenImage get padcostIcon =>
      const AssetGenImage('assets/images/padcost_icon.png');

  /// File path: assets/images/par.png
  AssetGenImage get par => const AssetGenImage('assets/images/par.png');

  /// File path: assets/images/podcast1.png
  AssetGenImage get podcast1 =>
      const AssetGenImage('assets/images/podcast1.png');

  /// File path: assets/images/programming.png
  AssetGenImage get programming =>
      const AssetGenImage('assets/images/programming.png');

  /// File path: assets/images/shutterstock_1982607317.png
  AssetGenImage get shutterstock1982607317 =>
      const AssetGenImage('assets/images/shutterstock_1982607317.png');

  /// File path: assets/images/startpage.png
  AssetGenImage get startpage =>
      const AssetGenImage('assets/images/startpage.png');

  /// File path: assets/images/user.png
  AssetGenImage get user => const AssetGenImage('assets/images/user.png');

  /// List of all assets
  List<dynamic> get values => [
        iconsabtnam,
        mappingMetaverse02,
        moonrayTheFirstBitcoinMetaverseGameOnStacksRaises35M,
        avatarIcon,
        felesh,
        hastag,
        homeicon,
        iconghalam,
        padcostIcon,
        par,
        podcast1,
        programming,
        shutterstock1982607317,
        startpage,
        user
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
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

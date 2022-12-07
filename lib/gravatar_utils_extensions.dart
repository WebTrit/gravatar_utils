import 'package:gravatar_utils/gravatar_utils.dart';

extension GravatarUntilsStringExtension on String {
  String gravatarImageUrl({
    String? scheme,
    FileTypeExtension? extension,
    int? size,
    Uri? defaultImageUrl,
    DefaultImage? defaultImage,
    bool? forceDefault,
    Rating? rating,
  }) {
    final url = Gravatar(this).image(
      scheme: scheme,
      extension: extension,
      size: size,
      defaultImageUrl: defaultImageUrl,
      defaultImage: defaultImage,
      forceDefault: forceDefault,
      rating: rating,
    );
    return url.toString();
  }

  String gravatarProfileUrl({
    String? scheme,
  }) {
    final url = Gravatar(this).profile(
      scheme: scheme,
    );
    return url.toString();
  }

  String gravatarProfileJSONUrl({
    String? scheme,
    String? callback,
  }) {
    final url = Gravatar(this).profileJSON(
      scheme: scheme,
      callback: callback,
    );
    return url.toString();
  }

  String gravatarProfileXMLUrl({
    String? scheme,
  }) {
    final url = Gravatar(this).profileXML(
      scheme: scheme,
    );
    return url.toString();
  }

  String gravatarProfileVCFUrl({
    String? scheme,
  }) {
    final url = Gravatar(this).profileVCF(
      scheme: scheme,
    );
    return url.toString();
  }

  String gravatarProfileQRUrl({
    String? scheme,
    int? size,
  }) {
    final url = Gravatar(this).profileQR(
      scheme: scheme,
      size: size,
    );
    return url.toString();
  }
}

import 'default_image.dart';
import 'file_type_extension.dart';
import 'hash.dart';
import 'query_parameter.dart';
import 'rating.dart';

class Gravatar {
  static const String host = 'www.gravatar.com';

  Gravatar(String email) : consistentEmail = reduce(email);

  final String consistentEmail;

  late final String hash = md5(consistentEmail);

  Uri image({
    String? scheme,
    FileTypeExtension? extension,
    int? size,
    Uri? defaultImageUrl,
    DefaultImage? defaultImage,
    bool? forceDefault,
    Rating? rating,
  }) {
    assert(
      size == null || (size >= 1 && size <= 2048),
      'Requested image size should be anywhere from 1px up to 2048px',
    );
    assert(defaultImageUrl == null || defaultImage == null, 'Cannot provide both a default image properties');

    final String path;
    if (extension != null) {
      path = '/avatar/$hash.${extension.name}';
    } else {
      path = '/avatar/$hash';
    }

    final queryParameters = <QueryParameter, String>{
      if (size != null) QueryParameter.size: size.toString(),
      if (defaultImageUrl != null) QueryParameter.defaultImage: Uri.encodeFull(defaultImageUrl.toString()),
      if (defaultImage != null) QueryParameter.defaultImage: defaultImage.value,
      if (forceDefault == true) QueryParameter.forceDefault: 'y',
      if (rating != null) QueryParameter.rating: rating.value,
    };

    return _createUri(
      scheme: scheme,
      path: path,
      queryParameters: queryParameters,
    );
  }

  Uri profile({
    String? scheme,
  }) {
    final path = '/$hash';

    const queryParameters = <QueryParameter, String>{};

    return _createUri(
      scheme: scheme,
      path: path,
      queryParameters: queryParameters,
    );
  }

  Uri profileJSON({
    String? scheme,
    String? callback,
  }) {
    final path = '/$hash.json';

    final queryParameters = <QueryParameter, String>{
      if (callback != null) QueryParameter.callback: callback,
    };

    return _createUri(
      scheme: scheme,
      path: path,
      queryParameters: queryParameters,
    );
  }

  Uri profileXML({
    String? scheme,
  }) {
    final path = '/$hash.xml';

    const queryParameters = <QueryParameter, String>{};

    return _createUri(
      scheme: scheme,
      path: path,
      queryParameters: queryParameters,
    );
  }

  Uri profileVCF({
    String? scheme,
  }) {
    final path = '/$hash.vcf';

    const queryParameters = <QueryParameter, String>{};

    return _createUri(
      scheme: scheme,
      path: path,
      queryParameters: queryParameters,
    );
  }

  Uri profileQR({
    String? scheme,
    int? size,
  }) {
    final path = '/$hash.qr';

    final queryParameters = <QueryParameter, String>{
      if (size != null) QueryParameter.size: size.toString(),
    };

    return _createUri(
      scheme: scheme,
      path: path,
      queryParameters: queryParameters,
    );
  }

  Uri _createUri({
    String? scheme,
    required String path,
    required Map<QueryParameter, String> queryParameters,
  }) =>
      Uri(
        scheme: scheme,
        host: host,
        path: path,
        queryParameters:
            queryParameters.isEmpty ? null : queryParameters.map((key, value) => MapEntry(key.value(), value)),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Gravatar && runtimeType == other.runtimeType && consistentEmail == other.consistentEmail;

  @override
  int get hashCode => consistentEmail.hashCode;
}

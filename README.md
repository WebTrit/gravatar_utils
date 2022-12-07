# gravatar_utils

A Dart package to [generate the URLs](https://en.gravatar.com/site/implement) required to request [Gravatar](https://en.gravatar.com) Images and Profile data.

## Features

Generate the URLs for all Gravatar Requests (except [PHP Profile Data](https://en.gravatar.com/site/implement/profiles/php/)).

## Getting started

Add `gravatar_utils` as a [dependency in your pubspec.yaml file](https://flutter.dev/using-packages/).

## Usage

With `Gravatar` object:
```dart
import 'package:gravatar_utils/gravatar_utils.dart';

void main() {
  final gravatar = Gravatar('example@email');
  print('Gravatar image URL: ${gravatar.image(scheme: 'https')}');
}
```

With `String` extension:
```dart
import 'package:gravatar_utils/gravatar_utils.dart';
import 'package:gravatar_utils/gravatar_utils_extensions.dart';

void main() {
  print('Gravatar image URL: ${'example@email'.gravatarImageUrl(scheme: 'https')}');
}
```

## Contributing

Contributions are always welcome!

## License

[MIT LICENSE](LICENSE)

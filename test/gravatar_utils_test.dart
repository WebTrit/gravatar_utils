import 'package:gravatar_utils/gravatar_utils_extensions.dart';
import 'package:test/test.dart';

import 'package:gravatar_utils/gravatar_utils.dart';

void main() {
  group('creating the Hash', () {
    test('ensure a consistent', () {
      // Trim leading and trailing whitespace from an email address
      expect(Gravatar(' MyEmailAddress@example.com'), equals(Gravatar('MyEmailAddress@example.com')));
      expect(Gravatar('MyEmailAddress@example.com '), equals(Gravatar('MyEmailAddress@example.com')));
      expect(Gravatar('   MyEmailAddress@example.com   '), equals(Gravatar('MyEmailAddress@example.com')));
      // Force all characters to lower-case
      expect(Gravatar('myemailaddress@example.com'), equals(Gravatar('MyEmailAddress@example.com')));
      expect(Gravatar('MYEMAILADDRESS@EXAMPLE.COM'), equals(Gravatar('MyEmailAddress@example.com')));
      expect(Gravatar('mYeMAILaDDRESS@EXAMPLE.COM'), equals(Gravatar('MyEmailAddress@example.com')));
      // Both above
      expect(Gravatar(' mYeMAILaDDRESS@EXAMPLE.COM '), equals(Gravatar('MyEmailAddress@example.com')));
    });
  });

  group('image', () {
    final gravatar = Gravatar('MyEmailAddress@example.com');

    test('with no parameters', () {
      expect(gravatar.image().toString(), equals('//www.gravatar.com/avatar/0bc83cb571cd1c50ba6f3e8a78ef1346'));
    });

    test('with all parameters', () {
      expect(
        gravatar
            .image(
              scheme: 'https',
              extension: FileTypeExtension.png,
              size: 100,
              defaultImage: DefaultImage.fileNotFound,
              forceDefault: true,
              rating: Rating.g,
            )
            .toString(),
        equals('https://www.gravatar.com/avatar/0bc83cb571cd1c50ba6f3e8a78ef1346.png?s=100&d=404&f=y&r=g'),
      );
    });

    test('size parameter assert', () {
      expect(() => gravatar.image(size: -1), throwsA(TypeMatcher<AssertionError>()));
      expect(() => gravatar.image(size: 0), throwsA(TypeMatcher<AssertionError>()));
      expect(() => gravatar.image(size: 2049), throwsA(TypeMatcher<AssertionError>()));
    });

    test('default image parameter assert', () {
      expect(
        () => gravatar.image(
          defaultImageUrl: Uri(),
          defaultImage: DefaultImage.blank,
        ),
        throwsA(TypeMatcher<AssertionError>()),
      );
    });

    test('default image url parameter', () {
      expect(
        gravatar
            .image(
              defaultImageUrl: Uri.parse('https://example.com/images/avatar.png'),
            )
            .toString(),
        equals(
          '//www.gravatar.com/avatar/0bc83cb571cd1c50ba6f3e8a78ef1346?d=https%3A%2F%2Fexample.com%2Fimages%2Favatar.png',
        ),
      );
    });
  });

  group('profile', () {
    final gravatar = Gravatar('MyEmailAddress@example.com');

    test('with no parameters', () {
      expect(
        gravatar.profile().toString(),
        equals('//www.gravatar.com/0bc83cb571cd1c50ba6f3e8a78ef1346'),
      );
    });

    test('with all parameters', () {
      expect(
        gravatar.profile(scheme: 'https').toString(),
        equals('https://www.gravatar.com/0bc83cb571cd1c50ba6f3e8a78ef1346'),
      );
    });
  });

  group('profileJSON', () {
    final gravatar = Gravatar('MyEmailAddress@example.com');

    test('with no parameters', () {
      expect(
        gravatar.profileJSON().toString(),
        equals('//www.gravatar.com/0bc83cb571cd1c50ba6f3e8a78ef1346.json'),
      );
    });

    test('with all parameters', () {
      expect(
        gravatar.profileJSON(scheme: 'https', callback: 'alert').toString(),
        equals('https://www.gravatar.com/0bc83cb571cd1c50ba6f3e8a78ef1346.json?callback=alert'),
      );
    });
  });

  group('profileXML', () {
    final gravatar = Gravatar('MyEmailAddress@example.com');

    test('with no parameters', () {
      expect(
        gravatar.profileXML().toString(),
        equals('//www.gravatar.com/0bc83cb571cd1c50ba6f3e8a78ef1346.xml'),
      );
    });

    test('with all parameters', () {
      expect(
        gravatar.profileXML(scheme: 'https').toString(),
        equals('https://www.gravatar.com/0bc83cb571cd1c50ba6f3e8a78ef1346.xml'),
      );
    });
  });

  group('profileVCF', () {
    final gravatar = Gravatar('MyEmailAddress@example.com');

    test('with no parameters', () {
      expect(
        gravatar.profileVCF().toString(),
        equals('//www.gravatar.com/0bc83cb571cd1c50ba6f3e8a78ef1346.vcf'),
      );
    });

    test('with all parameters', () {
      expect(
        gravatar.profileVCF(scheme: 'https').toString(),
        equals('https://www.gravatar.com/0bc83cb571cd1c50ba6f3e8a78ef1346.vcf'),
      );
    });
  });

  group('profileQR', () {
    final gravatar = Gravatar('MyEmailAddress@example.com');

    test('with no parameters', () {
      expect(
        gravatar.profileQR().toString(),
        equals('//www.gravatar.com/0bc83cb571cd1c50ba6f3e8a78ef1346.qr'),
      );
    });

    test('with all parameters', () {
      expect(
        gravatar.profileQR(scheme: 'https', size: 200).toString(),
        equals('https://www.gravatar.com/0bc83cb571cd1c50ba6f3e8a78ef1346.qr?s=200'),
      );
    });
  });

  group('extensions', () {
    test('on String', () {
      expect(
        'MyEmailAddress@example.com'.gravatarImageUrl(),
        equals(Gravatar('MyEmailAddress@example.com').image().toString()),
      );
      expect(
        'MyEmailAddress@example.com'.gravatarProfileUrl(),
        equals(Gravatar('MyEmailAddress@example.com').profile().toString()),
      );
      expect(
        'MyEmailAddress@example.com'.gravatarProfileJSONUrl(),
        equals(Gravatar('MyEmailAddress@example.com').profileJSON().toString()),
      );
      expect(
        'MyEmailAddress@example.com'.gravatarProfileXMLUrl(),
        equals(Gravatar('MyEmailAddress@example.com').profileXML().toString()),
      );
      expect(
        'MyEmailAddress@example.com'.gravatarProfileVCFUrl(),
        equals(Gravatar('MyEmailAddress@example.com').profileVCF().toString()),
      );
      expect(
        'MyEmailAddress@example.com'.gravatarProfileQRUrl(),
        equals(Gravatar('MyEmailAddress@example.com').profileQR().toString()),
      );
    });
  });
}

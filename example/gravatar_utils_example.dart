import 'package:gravatar_utils/gravatar_utils.dart';

void main(List<String> arguments) {
  for (final email in arguments) {
    final gravatar = Gravatar(email);
    print('Gravatar image URL: ${gravatar.image(scheme: 'https')}');
    print('Gravatar profile URL: ${gravatar.profile(scheme: 'https')}');
    print('Gravatar profile JSON URL: ${gravatar.profileJSON(scheme: 'https')}');
    print('Gravatar profile XML URL: ${gravatar.profileXML(scheme: 'https')}');
    print('Gravatar profile VCF URL: ${gravatar.profileVCF(scheme: 'https')}');
    print('Gravatar profile QR URL: ${gravatar.profileQR(scheme: 'https')}');
  }
}

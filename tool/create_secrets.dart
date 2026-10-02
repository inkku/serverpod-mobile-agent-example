import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  final file = File('rememberby_demo_server/config/passwords.yaml');
  if (file.existsSync()) return;
  final random = Random.secure();
  String secret() =>
      base64Url.encode(List.generate(64, (_) => random.nextInt(256)));
  final yaml = StringBuffer('# Local secrets. Never commit this file.\n');
  for (final mode in ['development', 'test', 'staging', 'production']) {
    yaml.writeln('$mode:');
    for (final key in [
      'database',
      'serviceSecret',
      'emailSecretHashPepper',
      'jwtHmacSha512PrivateKey',
      'jwtRefreshTokenHashPepper',
    ]) {
      yaml.writeln('  $key: ${secret()}');
    }
  }
  file.writeAsStringSync(yaml.toString());
}

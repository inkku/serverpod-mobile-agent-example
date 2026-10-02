import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';
import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Remembered items', (sessionBuilder, endpoints) {
    final alice = sessionBuilder.copyWith(
      authentication: AuthenticationOverride.authenticationInfo(
        '11111111-1111-4111-8111-111111111111',
        {Scope('user')},
      ),
    );
    final bob = sessionBuilder.copyWith(
      authentication: AuthenticationOverride.authenticationInfo(
        '22222222-2222-4222-8222-222222222222',
        {Scope('user')},
      ),
    );
    test('persists trimmed items and returns newest first', () async {
      await endpoints.items.add(alice, '  first  ');
      await endpoints.items.add(alice, 'second');
      final items = await endpoints.items.list(alice);
      expect(items.map((item) => item.text), ['second', 'first']);
    });
    test('isolates items between users', () async {
      await endpoints.items.add(alice, 'private');
      expect(await endpoints.items.list(bob), isEmpty);
    });
    test('anonymous access is rejected', () async {
      await expectLater(
        endpoints.items.list(sessionBuilder),
        throwsA(anything),
      );
      await expectLater(
        endpoints.items.add(sessionBuilder, 'no'),
        throwsA(anything),
      );
    });
    test('empty and oversized items are rejected', () async {
      await expectLater(endpoints.items.add(alice, '  '), throwsArgumentError);
      await expectLater(
        endpoints.items.add(alice, 'x' * 501),
        throwsArgumentError,
      );
    });
  });
}

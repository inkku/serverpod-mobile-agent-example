import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class ItemsEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;
  Future<List<RememberedItem>> list(Session session) async {
    return RememberedItem.db.find(
      session,
      where: (t) => t.ownerId.equals(session.authenticated!.userIdentifier),
      orderBy: (t) => t.id.desc(),
    );
  }

  Future<RememberedItem> add(Session session, String text) async {
    final value = text.trim();
    if (value.isEmpty || value.length > 500) {
      throw ArgumentError('Use between 1 and 500 characters.');
    }
    return RememberedItem.db.insertRow(
      session,
      RememberedItem(
        ownerId: session.authenticated!.userIdentifier,
        text: value,
        createdAt: DateTime.now().toUtc(),
      ),
    );
  }
}

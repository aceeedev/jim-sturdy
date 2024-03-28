import 'package:hive_flutter/hive_flutter.dart';
import 'package:jim_sturdy/models/session.dart';

class DB {
  static const String _sessionKey = 'session';

  static final DB instance = DB._init();
  static Box? _box;

  DB._init();

  Future<Box> get box async {
    if (_box != null) return _box!;

    _box = await Hive.openBox('db');
    return _box!;
  }

  Future<void> saveSession(Session session) async =>
      (await box).put(_sessionKey, session);

  Future<Session?> getSession() async => (await box).get(_sessionKey);

  Future<void> deleteSession() async => (await box).delete(_sessionKey);
}

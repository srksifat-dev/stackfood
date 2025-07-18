import 'package:hive_flutter/hive_flutter.dart';

class CacheService {
  CacheService();

  final Box<dynamic> _box = Hive.box('stackfood');

  static const _isLoggedIn = 'isLoggedIn';
  static const _bearerToken = 'bearerToken';
  static const _authToken = 'authToken';
  static const _refreshToken = 'refreshToken';

  bool get _isBoxOpen => _box.isOpen;

  Future<bool> get isLoggedIn async => await read<bool>(_isLoggedIn) ?? false;
  Future<void> setLoggedIn(bool value) async => save(_isLoggedIn, value);

  Future<String?> get bearerToken async => read<String>(_bearerToken);
  Future<void> setBearerToken(String value) async => save(_bearerToken, value);

  Future<String?> get authToken async => read<String>(_authToken);
  Future<void> setAuthToken(String value) async => save(_authToken, value);

  Future<String?> get refreshToken async => read<String>(_refreshToken);
  Future<void> setRefreshToken(String value) async =>
      save(_refreshToken, value);

  Future<void> delete(String key) async {
    try {
      await _box.delete(key);
    } catch (e) {
      // Optionally log
    }
  }

  Future<void> deleteAll() async {
    try {
      await _box.clear();
    } catch (e) {
      // Optionally log
    }
  }

  Future<void> save(String key, dynamic value) async {
    try {
      await _box.put(key, value);
    } catch (e) {
      // Optionally log
    }
  }

  Future<T?> read<T>(String key) async {
    try {
      final value = _box.get(key);
      if (value is T) return value;
    } catch (e) {
      // Optionally log
    }
    return null;
  }

  T? readSync<T>(String key) {
    try {
      final value = _box.get(key);
      if (value is T) return value;
    } catch (e) {
      // Optionally log
    }
    return null;
  }

  Future<void> clearAuthTokens() async {
    await delete(_isLoggedIn);
    await delete(_bearerToken);
    await delete(_refreshToken);
  }
}

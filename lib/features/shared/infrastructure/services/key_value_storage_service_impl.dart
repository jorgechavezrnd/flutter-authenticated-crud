import 'package:shared_preferences/shared_preferences.dart';
import 'key_value_storage_service.dart';

class KeyValueStorageServiceImpl extends KeyValueStorageService {
  SharedPreferences? _prefs;

  Future<SharedPreferences> getSharedPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  @override
  Future<T?> getValue<T>(String key) async {
    final prefs = await getSharedPrefs();

    return switch (T) {
      const (int) => prefs.getInt(key) as T?,
      const (String) => prefs.getString(key) as T?,
      _ => throw UnimplementedError('Get not implemented for type $T'),
    };
  }

  @override
  Future<bool> removeKey(String key) async {
    final prefs = await getSharedPrefs();
    return await prefs.remove(key);
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    final prefs = await getSharedPrefs();

    switch (value) {
      case int():
        await prefs.setInt(key, value);
      case String():
        await prefs.setString(key, value);
      default:
        throw UnimplementedError(
          'Set not implemented for type ${value.runtimeType}',
        );
    }
  }
}

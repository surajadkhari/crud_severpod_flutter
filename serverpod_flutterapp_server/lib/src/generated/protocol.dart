/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'example.dart' as _i2;
import 'todo.dart' as _i3;
import 'user_class.dart' as _i4;
import 'package:serverpod_flutterapp_server/src/generated/todo.dart' as _i5;
import 'package:serverpod_flutterapp_server/src/generated/user_class.dart'
    as _i6;
import 'package:serverpod/protocol.dart' as _i7;
export 'example.dart';
export 'todo.dart';
export 'user_class.dart'; // ignore_for_file: equal_keys_in_map

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.Example) {
      return _i2.Example.fromJson(data, this) as T;
    }
    if (t == _i3.TodoModel) {
      return _i3.TodoModel.fromJson(data, this) as T;
    }
    if (t == _i4.User) {
      return _i4.User.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Example?>()) {
      return (data != null ? _i2.Example.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.TodoModel?>()) {
      return (data != null ? _i3.TodoModel.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.User?>()) {
      return (data != null ? _i4.User.fromJson(data, this) : null) as T;
    }
    if (t == List<_i5.TodoModel>) {
      return (data as List).map((e) => deserialize<_i5.TodoModel>(e)).toList()
          as dynamic;
    }
    if (t == List<_i6.User>) {
      return (data as List).map((e) => deserialize<_i6.User>(e)).toList()
          as dynamic;
    }
    try {
      return _i7.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.Example) {
      return 'Example';
    }
    if (data is _i3.TodoModel) {
      return 'TodoModel';
    }
    if (data is _i4.User) {
      return 'User';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Example') {
      return deserialize<_i2.Example>(data['data']);
    }
    if (data['className'] == 'TodoModel') {
      return deserialize<_i3.TodoModel>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i4.User>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i7.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i3.TodoModel:
        return _i3.TodoModel.t;
      case _i4.User:
        return _i4.User.t;
    }
    return null;
  }
}

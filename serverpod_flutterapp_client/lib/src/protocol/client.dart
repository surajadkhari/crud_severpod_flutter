/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:serverpod_flutterapp_client/src/protocol/todo.dart' as _i3;
import 'package:serverpod_flutterapp_client/src/protocol/user_class.dart'
    as _i4;
import 'dart:io' as _i5;
import 'protocol.dart' as _i6;

class _EndpointExample extends _i1.EndpointRef {
  _EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

class _EndpointTodo extends _i1.EndpointRef {
  _EndpointTodo(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'todo';

  _i2.Future<_i3.TodoModel> createTodo(_i3.TodoModel todo) =>
      caller.callServerEndpoint<_i3.TodoModel>(
        'todo',
        'createTodo',
        {'todo': todo},
      );

  _i2.Future<_i3.TodoModel?> getUserById(int id) =>
      caller.callServerEndpoint<_i3.TodoModel?>(
        'todo',
        'getUserById',
        {'id': id},
      );

  _i2.Future<List<_i3.TodoModel>> getAllUser() =>
      caller.callServerEndpoint<List<_i3.TodoModel>>(
        'todo',
        'getAllUser',
        {},
      );

  _i2.Future<_i3.TodoModel> update(_i3.TodoModel todo) =>
      caller.callServerEndpoint<_i3.TodoModel>(
        'todo',
        'update',
        {'todo': todo},
      );

  _i2.Future<void> delete(int id) => caller.callServerEndpoint<void>(
        'todo',
        'delete',
        {'id': id},
      );
}

class _EndpointUser extends _i1.EndpointRef {
  _EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'user',
        'hello',
        {'name': name},
      );

  _i2.Future<_i4.User> createUser(_i4.User user) =>
      caller.callServerEndpoint<_i4.User>(
        'user',
        'createUser',
        {'user': user},
      );

  _i2.Future<_i4.User?> getUserById(int id) =>
      caller.callServerEndpoint<_i4.User?>(
        'user',
        'getUserById',
        {'id': id},
      );

  _i2.Future<List<_i4.User>> getAllUser() =>
      caller.callServerEndpoint<List<_i4.User>>(
        'user',
        'getAllUser',
        {},
      );

  _i2.Future<_i4.User> update(_i4.User user) =>
      caller.callServerEndpoint<_i4.User>(
        'user',
        'update',
        {'user': user},
      );

  _i2.Future<void> delete(int id) => caller.callServerEndpoint<void>(
        'user',
        'delete',
        {'id': id},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i5.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i6.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    example = _EndpointExample(this);
    todo = _EndpointTodo(this);
    user = _EndpointUser(this);
  }

  late final _EndpointExample example;

  late final _EndpointTodo todo;

  late final _EndpointUser user;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'example': example,
        'todo': todo,
        'user': user,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}

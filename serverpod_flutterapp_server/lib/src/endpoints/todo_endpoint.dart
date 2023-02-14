import 'package:serverpod/serverpod.dart';

import '../generated/todo.dart';

class TodoEndpoint extends Endpoint {
  Future<TodoModel> createTodo(Session session, TodoModel todo) async {
    await TodoModel.insert(session, todo);
    return todo;
  }

  Future<TodoModel?> getUserById(Session session, int id) async {
    return await TodoModel.findById(session, id);
  }

  Future<List<TodoModel>> getAllUser(
    Session session,
  ) async {
    return await TodoModel.find(session);
  }

  Future<TodoModel> update(Session session, TodoModel todo) async {
    await TodoModel.update(session, todo);
    return todo;
  }

  Future<void> delete(Session session, int id) async {
    await TodoModel.delete(session, where: (todo) => todo.id.equals(id));
  }
}

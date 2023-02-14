import 'package:serverpod/serverpod.dart';
import '../generated/user_class.dart';

class UserEndpoint extends Endpoint {
  Future<String> hello(Session session, String name) async {
    return 'Hello $name';
  }

  Future<User> createUser(Session session, User user) async {
    await User.insert(session, user);
    return user;
  }

  Future<User?> getUserById(Session session, int id) async {
    return await User.findById(session, id);
  }

  Future<List<User>> getAllUser(
    Session session,
  ) async {
    return await User.find(session);
  }

  Future<User> update(Session session, User user) async {
    await User.update(session, user);
    return user;
  }

  Future<void> delete(Session session, int id) async {
    await User.delete(session, where: (user) => user.id.equals(id));
  }
}

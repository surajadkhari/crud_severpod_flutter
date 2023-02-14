/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class TodoModel extends _i1.TableRow {
  TodoModel({
    int? id,
    required this.title,
    required this.description,
    required this.isCompleted,
  }) : super(id);

  factory TodoModel.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return TodoModel(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      isCompleted: serializationManager
          .deserialize<bool>(jsonSerialization['isCompleted']),
    );
  }

  static final t = TodoModelTable();

  String title;

  String description;

  bool isCompleted;

  @override
  String get tableName => 'todo_tb';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'title':
        title = value;
        return;
      case 'description':
        description = value;
        return;
      case 'isCompleted':
        isCompleted = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<TodoModel>> find(
    _i1.Session session, {
    TodoModelExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<TodoModel>(
      where: where != null ? where(TodoModel.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<TodoModel?> findSingleRow(
    _i1.Session session, {
    TodoModelExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<TodoModel>(
      where: where != null ? where(TodoModel.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<TodoModel?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<TodoModel>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required TodoModelExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TodoModel>(
      where: where(TodoModel.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    TodoModel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    TodoModel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    TodoModel row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    TodoModelExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TodoModel>(
      where: where != null ? where(TodoModel.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef TodoModelExpressionBuilder = _i1.Expression Function(TodoModelTable);

class TodoModelTable extends _i1.Table {
  TodoModelTable() : super(tableName: 'todo_tb');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final title = _i1.ColumnString('title');

  final description = _i1.ColumnString('description');

  final isCompleted = _i1.ColumnBool('isCompleted');

  @override
  List<_i1.Column> get columns => [
        id,
        title,
        description,
        isCompleted,
      ];
}

@Deprecated('Use TodoModelTable.t instead.')
TodoModelTable tTodoModel = TodoModelTable();

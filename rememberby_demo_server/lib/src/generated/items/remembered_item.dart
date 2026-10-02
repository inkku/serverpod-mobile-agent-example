/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _is;

abstract class RememberedItem
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  RememberedItem._({
    this.id,
    required this.ownerId,
    required this.text,
    required this.createdAt,
  });

  factory RememberedItem({
    int? id,
    required String ownerId,
    required String text,
    required DateTime createdAt,
  }) = _RememberedItemImpl;

  factory RememberedItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return RememberedItem(
      id: jsonSerialization['id'] as int?,
      ownerId: jsonSerialization['ownerId'] as String,
      text: jsonSerialization['text'] as String,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = RememberedItemTable();

  static const db = RememberedItemRepository._();

  @override
  int? id;

  String ownerId;

  String text;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [RememberedItem]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  RememberedItem copyWith({
    int? id,
    String? ownerId,
    String? text,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RememberedItem',
      if (id != null) 'id': id,
      'ownerId': ownerId,
      'text': text,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RememberedItem',
      if (id != null) 'id': id,
      'ownerId': ownerId,
      'text': text,
      'createdAt': createdAt.toJson(),
    };
  }

  static RememberedItemInclude include() {
    return RememberedItemInclude._();
  }

  static RememberedItemIncludeList includeList({
    _is.WhereExpressionBuilder<RememberedItemTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RememberedItemTable>? orderBy,
    _is.OrderByListBuilder<RememberedItemTable>? orderByList,
    RememberedItemInclude? include,
  }) {
    return RememberedItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RememberedItem.t),
      orderByList: orderByList?.call(RememberedItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RememberedItemImpl extends RememberedItem {
  _RememberedItemImpl({
    int? id,
    required String ownerId,
    required String text,
    required DateTime createdAt,
  }) : super._(
         id: id,
         ownerId: ownerId,
         text: text,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [RememberedItem]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  RememberedItem copyWith({
    Object? id = _Undefined,
    String? ownerId,
    String? text,
    DateTime? createdAt,
  }) {
    return RememberedItem(
      id: id is int? ? id : this.id,
      ownerId: ownerId ?? this.ownerId,
      text: text ?? this.text,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class RememberedItemUpdateTable extends _is.UpdateTable<RememberedItemTable> {
  RememberedItemUpdateTable(super.table);

  _is.ColumnValue<String, String> ownerId(String value) => _is.ColumnValue(
    table.ownerId,
    value,
  );

  _is.ColumnValue<String, String> text(String value) => _is.ColumnValue(
    table.text,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class RememberedItemTable extends _is.Table<int?> {
  RememberedItemTable({super.tableRelation})
    : super(tableName: 'remembered_item') {
    updateTable = RememberedItemUpdateTable(this);
    ownerId = _is.ColumnString(
      'ownerId',
      this,
    );
    text = _is.ColumnString(
      'text',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final RememberedItemUpdateTable updateTable;

  late final _is.ColumnString ownerId;

  late final _is.ColumnString text;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    ownerId,
    text,
    createdAt,
  ];
}

class RememberedItemInclude extends _is.IncludeObject {
  RememberedItemInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => RememberedItem.t;
}

class RememberedItemIncludeList extends _is.IncludeList {
  RememberedItemIncludeList._({
    _is.WhereExpressionBuilder<RememberedItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RememberedItem.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => RememberedItem.t;
}

class RememberedItemRepository {
  const RememberedItemRepository._();

  /// Returns a list of [RememberedItem]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<RememberedItem>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RememberedItemTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RememberedItemTable>? orderBy,
    _is.OrderByListBuilder<RememberedItemTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<RememberedItem>(
      where: where?.call(RememberedItem.t),
      orderBy: orderBy?.call(RememberedItem.t),
      orderByList: orderByList?.call(RememberedItem.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [RememberedItem] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<RememberedItem?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RememberedItemTable>? where,
    int? offset,
    _is.OrderByBuilder<RememberedItemTable>? orderBy,
    _is.OrderByListBuilder<RememberedItemTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<RememberedItem>(
      where: where?.call(RememberedItem.t),
      orderBy: orderBy?.call(RememberedItem.t),
      orderByList: orderByList?.call(RememberedItem.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [RememberedItem] by its [id] or null if no such row exists.
  Future<RememberedItem?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<RememberedItem>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [RememberedItem]s in the list and returns the inserted rows.
  ///
  /// The returned [RememberedItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RememberedItem>> insert(
    _is.DatabaseSession session,
    List<RememberedItem> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<RememberedItem>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [RememberedItem] and returns the inserted row.
  ///
  /// The returned [RememberedItem] will have its `id` field set.
  Future<RememberedItem> insertRow(
    _is.DatabaseSession session,
    RememberedItem row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<RememberedItem>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [RememberedItem]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [RememberedItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RememberedItem>> upsert(
    _is.DatabaseSession session,
    List<RememberedItem> rows, {
    required _is.ColumnSelections<RememberedItemTable> conflictColumns,
    _is.ColumnSelections<RememberedItemTable>? updateColumns,
    _is.WhereExpressionBuilder<RememberedItemTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<RememberedItem>(
      rows,
      conflictColumns: conflictColumns(RememberedItem.t),
      updateColumns: updateColumns?.call(RememberedItem.t),
      updateWhere: updateWhere?.call(RememberedItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [RememberedItem] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [RememberedItem] will have its `id` field set.
  Future<RememberedItem?> upsertRow(
    _is.DatabaseSession session,
    RememberedItem row, {
    required _is.ColumnSelections<RememberedItemTable> conflictColumns,
    _is.ColumnSelections<RememberedItemTable>? updateColumns,
    _is.WhereExpressionBuilder<RememberedItemTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<RememberedItem>(
      row,
      conflictColumns: conflictColumns(RememberedItem.t),
      updateColumns: updateColumns?.call(RememberedItem.t),
      updateWhere: updateWhere?.call(RememberedItem.t),
      transaction: transaction,
    );
  }

  /// Updates all [RememberedItem]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RememberedItem>> update(
    _is.DatabaseSession session,
    List<RememberedItem> rows, {
    _is.ColumnSelections<RememberedItemTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<RememberedItem>(
      rows,
      columns: columns?.call(RememberedItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [RememberedItem]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RememberedItem> updateRow(
    _is.DatabaseSession session,
    RememberedItem row, {
    _is.ColumnSelections<RememberedItemTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<RememberedItem>(
      row,
      columns: columns?.call(RememberedItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RememberedItem] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<RememberedItem?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<RememberedItemUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<RememberedItem>(
      id,
      columnValues: columnValues(RememberedItem.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [RememberedItem]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RememberedItem>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<RememberedItemUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<RememberedItemTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<RememberedItemTable>? orderBy,
    _is.OrderByListBuilder<RememberedItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<RememberedItem>(
      columnValues: columnValues(RememberedItem.t.updateTable),
      where: where(RememberedItem.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RememberedItem.t),
      orderByList: orderByList?.call(RememberedItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [RememberedItem]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RememberedItem>> delete(
    _is.DatabaseSession session,
    List<RememberedItem> rows, {
    _is.OrderByBuilder<RememberedItemTable>? orderBy,
    _is.OrderByListBuilder<RememberedItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<RememberedItem>(
      rows,
      orderBy: orderBy?.call(RememberedItem.t),
      orderByList: orderByList?.call(RememberedItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [RememberedItem].
  Future<RememberedItem> deleteRow(
    _is.DatabaseSession session,
    RememberedItem row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RememberedItem>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<RememberedItem>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RememberedItemTable> where,
    _is.OrderByBuilder<RememberedItemTable>? orderBy,
    _is.OrderByListBuilder<RememberedItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<RememberedItem>(
      where: where(RememberedItem.t),
      orderBy: orderBy?.call(RememberedItem.t),
      orderByList: orderByList?.call(RememberedItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<RememberedItemTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<RememberedItem>(
      where: where?.call(RememberedItem.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [RememberedItem] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<RememberedItemTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<RememberedItem>(
      where: where(RememberedItem.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

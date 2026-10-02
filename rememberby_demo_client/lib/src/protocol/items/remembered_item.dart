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
import 'package:serverpod_client/serverpod_client.dart' as _isc;

abstract class RememberedItem
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
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
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String ownerId;

  String text;

  DateTime createdAt;

  /// Returns a shallow copy of this [RememberedItem]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
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

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
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
  @_isc.useResult
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

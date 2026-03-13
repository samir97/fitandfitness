// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'water.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Water _$WaterFromJson(Map<String, dynamic> json) {
  return _Water.fromJson(json);
}

/// @nodoc
mixin _$Water {
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get id => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  @TimestampConverter()
  @JsonKey(name: 'recorded_at')
  DateTime get recordedAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  @JsonKey(name: 'modified_at')
  DateTime get modifiedAt => throw _privateConstructorUsedError;

  /// Serializes this Water to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Water
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WaterCopyWith<Water> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaterCopyWith<$Res> {
  factory $WaterCopyWith(Water value, $Res Function(Water) then) =
      _$WaterCopyWithImpl<$Res, Water>;
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) String? id,
      double quantity,
      @TimestampConverter() @JsonKey(name: 'recorded_at') DateTime recordedAt,
      @TimestampConverter() @JsonKey(name: 'modified_at') DateTime modifiedAt});
}

/// @nodoc
class _$WaterCopyWithImpl<$Res, $Val extends Water>
    implements $WaterCopyWith<$Res> {
  _$WaterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Water
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? quantity = null,
    Object? recordedAt = null,
    Object? modifiedAt = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      recordedAt: null == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modifiedAt: null == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WaterImplCopyWith<$Res> implements $WaterCopyWith<$Res> {
  factory _$$WaterImplCopyWith(
          _$WaterImpl value, $Res Function(_$WaterImpl) then) =
      __$$WaterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) String? id,
      double quantity,
      @TimestampConverter() @JsonKey(name: 'recorded_at') DateTime recordedAt,
      @TimestampConverter() @JsonKey(name: 'modified_at') DateTime modifiedAt});
}

/// @nodoc
class __$$WaterImplCopyWithImpl<$Res>
    extends _$WaterCopyWithImpl<$Res, _$WaterImpl>
    implements _$$WaterImplCopyWith<$Res> {
  __$$WaterImplCopyWithImpl(
      _$WaterImpl _value, $Res Function(_$WaterImpl) _then)
      : super(_value, _then);

  /// Create a copy of Water
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? quantity = null,
    Object? recordedAt = null,
    Object? modifiedAt = null,
  }) {
    return _then(_$WaterImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      recordedAt: null == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modifiedAt: null == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WaterImpl implements _Water {
  const _$WaterImpl(
      {@JsonKey(includeFromJson: false, includeToJson: false) this.id,
      required this.quantity,
      @TimestampConverter()
      @JsonKey(name: 'recorded_at')
      required this.recordedAt,
      @TimestampConverter()
      @JsonKey(name: 'modified_at')
      required this.modifiedAt});

  factory _$WaterImpl.fromJson(Map<String, dynamic> json) =>
      _$$WaterImplFromJson(json);

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? id;
  @override
  final double quantity;
  @override
  @TimestampConverter()
  @JsonKey(name: 'recorded_at')
  final DateTime recordedAt;
  @override
  @TimestampConverter()
  @JsonKey(name: 'modified_at')
  final DateTime modifiedAt;

  @override
  String toString() {
    return 'Water(id: $id, quantity: $quantity, recordedAt: $recordedAt, modifiedAt: $modifiedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WaterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, quantity, recordedAt, modifiedAt);

  /// Create a copy of Water
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WaterImplCopyWith<_$WaterImpl> get copyWith =>
      __$$WaterImplCopyWithImpl<_$WaterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WaterImplToJson(
      this,
    );
  }
}

abstract class _Water implements Water {
  const factory _Water(
      {@JsonKey(includeFromJson: false, includeToJson: false) final String? id,
      required final double quantity,
      @TimestampConverter()
      @JsonKey(name: 'recorded_at')
      required final DateTime recordedAt,
      @TimestampConverter()
      @JsonKey(name: 'modified_at')
      required final DateTime modifiedAt}) = _$WaterImpl;

  factory _Water.fromJson(Map<String, dynamic> json) = _$WaterImpl.fromJson;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get id;
  @override
  double get quantity;
  @override
  @TimestampConverter()
  @JsonKey(name: 'recorded_at')
  DateTime get recordedAt;
  @override
  @TimestampConverter()
  @JsonKey(name: 'modified_at')
  DateTime get modifiedAt;

  /// Create a copy of Water
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WaterImplCopyWith<_$WaterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

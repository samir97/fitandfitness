// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProgressPhoto _$ProgressPhotoFromJson(Map<String, dynamic> json) {
  return _ProgressPhoto.fromJson(json);
}

/// @nodoc
mixin _$ProgressPhoto {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  DateTime get recordedAt => throw _privateConstructorUsedError;

  /// Serializes this ProgressPhoto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProgressPhoto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProgressPhotoCopyWith<ProgressPhoto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressPhotoCopyWith<$Res> {
  factory $ProgressPhotoCopyWith(
          ProgressPhoto value, $Res Function(ProgressPhoto) then) =
      _$ProgressPhotoCopyWithImpl<$Res, ProgressPhoto>;
  @useResult
  $Res call({String name, String url, DateTime recordedAt});
}

/// @nodoc
class _$ProgressPhotoCopyWithImpl<$Res, $Val extends ProgressPhoto>
    implements $ProgressPhotoCopyWith<$Res> {
  _$ProgressPhotoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProgressPhoto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
    Object? recordedAt = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      recordedAt: null == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgressPhotoImplCopyWith<$Res>
    implements $ProgressPhotoCopyWith<$Res> {
  factory _$$ProgressPhotoImplCopyWith(
          _$ProgressPhotoImpl value, $Res Function(_$ProgressPhotoImpl) then) =
      __$$ProgressPhotoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url, DateTime recordedAt});
}

/// @nodoc
class __$$ProgressPhotoImplCopyWithImpl<$Res>
    extends _$ProgressPhotoCopyWithImpl<$Res, _$ProgressPhotoImpl>
    implements _$$ProgressPhotoImplCopyWith<$Res> {
  __$$ProgressPhotoImplCopyWithImpl(
      _$ProgressPhotoImpl _value, $Res Function(_$ProgressPhotoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProgressPhoto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
    Object? recordedAt = null,
  }) {
    return _then(_$ProgressPhotoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      recordedAt: null == recordedAt
          ? _value.recordedAt
          : recordedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgressPhotoImpl implements _ProgressPhoto {
  const _$ProgressPhotoImpl(
      {required this.name, required this.url, required this.recordedAt});

  factory _$ProgressPhotoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgressPhotoImplFromJson(json);

  @override
  final String name;
  @override
  final String url;
  @override
  final DateTime recordedAt;

  @override
  String toString() {
    return 'ProgressPhoto(name: $name, url: $url, recordedAt: $recordedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressPhotoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url, recordedAt);

  /// Create a copy of ProgressPhoto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressPhotoImplCopyWith<_$ProgressPhotoImpl> get copyWith =>
      __$$ProgressPhotoImplCopyWithImpl<_$ProgressPhotoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgressPhotoImplToJson(
      this,
    );
  }
}

abstract class _ProgressPhoto implements ProgressPhoto {
  const factory _ProgressPhoto(
      {required final String name,
      required final String url,
      required final DateTime recordedAt}) = _$ProgressPhotoImpl;

  factory _ProgressPhoto.fromJson(Map<String, dynamic> json) =
      _$ProgressPhotoImpl.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  DateTime get recordedAt;

  /// Create a copy of ProgressPhoto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgressPhotoImplCopyWith<_$ProgressPhotoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

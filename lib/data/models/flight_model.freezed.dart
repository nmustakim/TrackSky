// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FlightModel _$FlightModelFromJson(Map<String, dynamic> json) {
  return _FlightModel.fromJson(json);
}

/// @nodoc
mixin _$FlightModel {
  String get icao24 => throw _privateConstructorUsedError;
  String? get callsign => throw _privateConstructorUsedError;
  String? get originCountry => throw _privateConstructorUsedError;
  int? get timePosition => throw _privateConstructorUsedError;
  int? get lastContact => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get baroAltitude => throw _privateConstructorUsedError;
  bool? get onGround => throw _privateConstructorUsedError;
  double? get velocity => throw _privateConstructorUsedError;
  double? get trueTrack => throw _privateConstructorUsedError;
  double? get verticalRate => throw _privateConstructorUsedError;
  List<int>? get sensors => throw _privateConstructorUsedError;
  double? get geoAltitude => throw _privateConstructorUsedError;
  String? get squawk => throw _privateConstructorUsedError;
  bool? get spi => throw _privateConstructorUsedError;
  int? get positionSource => throw _privateConstructorUsedError;

  /// Serializes this FlightModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlightModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlightModelCopyWith<FlightModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightModelCopyWith<$Res> {
  factory $FlightModelCopyWith(
    FlightModel value,
    $Res Function(FlightModel) then,
  ) = _$FlightModelCopyWithImpl<$Res, FlightModel>;
  @useResult
  $Res call({
    String icao24,
    String? callsign,
    String? originCountry,
    int? timePosition,
    int? lastContact,
    double? longitude,
    double? latitude,
    double? baroAltitude,
    bool? onGround,
    double? velocity,
    double? trueTrack,
    double? verticalRate,
    List<int>? sensors,
    double? geoAltitude,
    String? squawk,
    bool? spi,
    int? positionSource,
  });
}

/// @nodoc
class _$FlightModelCopyWithImpl<$Res, $Val extends FlightModel>
    implements $FlightModelCopyWith<$Res> {
  _$FlightModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlightModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icao24 = null,
    Object? callsign = freezed,
    Object? originCountry = freezed,
    Object? timePosition = freezed,
    Object? lastContact = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? baroAltitude = freezed,
    Object? onGround = freezed,
    Object? velocity = freezed,
    Object? trueTrack = freezed,
    Object? verticalRate = freezed,
    Object? sensors = freezed,
    Object? geoAltitude = freezed,
    Object? squawk = freezed,
    Object? spi = freezed,
    Object? positionSource = freezed,
  }) {
    return _then(
      _value.copyWith(
            icao24:
                null == icao24
                    ? _value.icao24
                    : icao24 // ignore: cast_nullable_to_non_nullable
                        as String,
            callsign:
                freezed == callsign
                    ? _value.callsign
                    : callsign // ignore: cast_nullable_to_non_nullable
                        as String?,
            originCountry:
                freezed == originCountry
                    ? _value.originCountry
                    : originCountry // ignore: cast_nullable_to_non_nullable
                        as String?,
            timePosition:
                freezed == timePosition
                    ? _value.timePosition
                    : timePosition // ignore: cast_nullable_to_non_nullable
                        as int?,
            lastContact:
                freezed == lastContact
                    ? _value.lastContact
                    : lastContact // ignore: cast_nullable_to_non_nullable
                        as int?,
            longitude:
                freezed == longitude
                    ? _value.longitude
                    : longitude // ignore: cast_nullable_to_non_nullable
                        as double?,
            latitude:
                freezed == latitude
                    ? _value.latitude
                    : latitude // ignore: cast_nullable_to_non_nullable
                        as double?,
            baroAltitude:
                freezed == baroAltitude
                    ? _value.baroAltitude
                    : baroAltitude // ignore: cast_nullable_to_non_nullable
                        as double?,
            onGround:
                freezed == onGround
                    ? _value.onGround
                    : onGround // ignore: cast_nullable_to_non_nullable
                        as bool?,
            velocity:
                freezed == velocity
                    ? _value.velocity
                    : velocity // ignore: cast_nullable_to_non_nullable
                        as double?,
            trueTrack:
                freezed == trueTrack
                    ? _value.trueTrack
                    : trueTrack // ignore: cast_nullable_to_non_nullable
                        as double?,
            verticalRate:
                freezed == verticalRate
                    ? _value.verticalRate
                    : verticalRate // ignore: cast_nullable_to_non_nullable
                        as double?,
            sensors:
                freezed == sensors
                    ? _value.sensors
                    : sensors // ignore: cast_nullable_to_non_nullable
                        as List<int>?,
            geoAltitude:
                freezed == geoAltitude
                    ? _value.geoAltitude
                    : geoAltitude // ignore: cast_nullable_to_non_nullable
                        as double?,
            squawk:
                freezed == squawk
                    ? _value.squawk
                    : squawk // ignore: cast_nullable_to_non_nullable
                        as String?,
            spi:
                freezed == spi
                    ? _value.spi
                    : spi // ignore: cast_nullable_to_non_nullable
                        as bool?,
            positionSource:
                freezed == positionSource
                    ? _value.positionSource
                    : positionSource // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FlightModelImplCopyWith<$Res>
    implements $FlightModelCopyWith<$Res> {
  factory _$$FlightModelImplCopyWith(
    _$FlightModelImpl value,
    $Res Function(_$FlightModelImpl) then,
  ) = __$$FlightModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String icao24,
    String? callsign,
    String? originCountry,
    int? timePosition,
    int? lastContact,
    double? longitude,
    double? latitude,
    double? baroAltitude,
    bool? onGround,
    double? velocity,
    double? trueTrack,
    double? verticalRate,
    List<int>? sensors,
    double? geoAltitude,
    String? squawk,
    bool? spi,
    int? positionSource,
  });
}

/// @nodoc
class __$$FlightModelImplCopyWithImpl<$Res>
    extends _$FlightModelCopyWithImpl<$Res, _$FlightModelImpl>
    implements _$$FlightModelImplCopyWith<$Res> {
  __$$FlightModelImplCopyWithImpl(
    _$FlightModelImpl _value,
    $Res Function(_$FlightModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FlightModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icao24 = null,
    Object? callsign = freezed,
    Object? originCountry = freezed,
    Object? timePosition = freezed,
    Object? lastContact = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? baroAltitude = freezed,
    Object? onGround = freezed,
    Object? velocity = freezed,
    Object? trueTrack = freezed,
    Object? verticalRate = freezed,
    Object? sensors = freezed,
    Object? geoAltitude = freezed,
    Object? squawk = freezed,
    Object? spi = freezed,
    Object? positionSource = freezed,
  }) {
    return _then(
      _$FlightModelImpl(
        icao24:
            null == icao24
                ? _value.icao24
                : icao24 // ignore: cast_nullable_to_non_nullable
                    as String,
        callsign:
            freezed == callsign
                ? _value.callsign
                : callsign // ignore: cast_nullable_to_non_nullable
                    as String?,
        originCountry:
            freezed == originCountry
                ? _value.originCountry
                : originCountry // ignore: cast_nullable_to_non_nullable
                    as String?,
        timePosition:
            freezed == timePosition
                ? _value.timePosition
                : timePosition // ignore: cast_nullable_to_non_nullable
                    as int?,
        lastContact:
            freezed == lastContact
                ? _value.lastContact
                : lastContact // ignore: cast_nullable_to_non_nullable
                    as int?,
        longitude:
            freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                    as double?,
        latitude:
            freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                    as double?,
        baroAltitude:
            freezed == baroAltitude
                ? _value.baroAltitude
                : baroAltitude // ignore: cast_nullable_to_non_nullable
                    as double?,
        onGround:
            freezed == onGround
                ? _value.onGround
                : onGround // ignore: cast_nullable_to_non_nullable
                    as bool?,
        velocity:
            freezed == velocity
                ? _value.velocity
                : velocity // ignore: cast_nullable_to_non_nullable
                    as double?,
        trueTrack:
            freezed == trueTrack
                ? _value.trueTrack
                : trueTrack // ignore: cast_nullable_to_non_nullable
                    as double?,
        verticalRate:
            freezed == verticalRate
                ? _value.verticalRate
                : verticalRate // ignore: cast_nullable_to_non_nullable
                    as double?,
        sensors:
            freezed == sensors
                ? _value._sensors
                : sensors // ignore: cast_nullable_to_non_nullable
                    as List<int>?,
        geoAltitude:
            freezed == geoAltitude
                ? _value.geoAltitude
                : geoAltitude // ignore: cast_nullable_to_non_nullable
                    as double?,
        squawk:
            freezed == squawk
                ? _value.squawk
                : squawk // ignore: cast_nullable_to_non_nullable
                    as String?,
        spi:
            freezed == spi
                ? _value.spi
                : spi // ignore: cast_nullable_to_non_nullable
                    as bool?,
        positionSource:
            freezed == positionSource
                ? _value.positionSource
                : positionSource // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FlightModelImpl implements _FlightModel {
  const _$FlightModelImpl({
    required this.icao24,
    this.callsign,
    this.originCountry,
    this.timePosition,
    this.lastContact,
    this.longitude,
    this.latitude,
    this.baroAltitude,
    this.onGround,
    this.velocity,
    this.trueTrack,
    this.verticalRate,
    final List<int>? sensors,
    this.geoAltitude,
    this.squawk,
    this.spi,
    this.positionSource,
  }) : _sensors = sensors;

  factory _$FlightModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlightModelImplFromJson(json);

  @override
  final String icao24;
  @override
  final String? callsign;
  @override
  final String? originCountry;
  @override
  final int? timePosition;
  @override
  final int? lastContact;
  @override
  final double? longitude;
  @override
  final double? latitude;
  @override
  final double? baroAltitude;
  @override
  final bool? onGround;
  @override
  final double? velocity;
  @override
  final double? trueTrack;
  @override
  final double? verticalRate;
  final List<int>? _sensors;
  @override
  List<int>? get sensors {
    final value = _sensors;
    if (value == null) return null;
    if (_sensors is EqualUnmodifiableListView) return _sensors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? geoAltitude;
  @override
  final String? squawk;
  @override
  final bool? spi;
  @override
  final int? positionSource;

  @override
  String toString() {
    return 'FlightModel(icao24: $icao24, callsign: $callsign, originCountry: $originCountry, timePosition: $timePosition, lastContact: $lastContact, longitude: $longitude, latitude: $latitude, baroAltitude: $baroAltitude, onGround: $onGround, velocity: $velocity, trueTrack: $trueTrack, verticalRate: $verticalRate, sensors: $sensors, geoAltitude: $geoAltitude, squawk: $squawk, spi: $spi, positionSource: $positionSource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlightModelImpl &&
            (identical(other.icao24, icao24) || other.icao24 == icao24) &&
            (identical(other.callsign, callsign) ||
                other.callsign == callsign) &&
            (identical(other.originCountry, originCountry) ||
                other.originCountry == originCountry) &&
            (identical(other.timePosition, timePosition) ||
                other.timePosition == timePosition) &&
            (identical(other.lastContact, lastContact) ||
                other.lastContact == lastContact) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.baroAltitude, baroAltitude) ||
                other.baroAltitude == baroAltitude) &&
            (identical(other.onGround, onGround) ||
                other.onGround == onGround) &&
            (identical(other.velocity, velocity) ||
                other.velocity == velocity) &&
            (identical(other.trueTrack, trueTrack) ||
                other.trueTrack == trueTrack) &&
            (identical(other.verticalRate, verticalRate) ||
                other.verticalRate == verticalRate) &&
            const DeepCollectionEquality().equals(other._sensors, _sensors) &&
            (identical(other.geoAltitude, geoAltitude) ||
                other.geoAltitude == geoAltitude) &&
            (identical(other.squawk, squawk) || other.squawk == squawk) &&
            (identical(other.spi, spi) || other.spi == spi) &&
            (identical(other.positionSource, positionSource) ||
                other.positionSource == positionSource));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    icao24,
    callsign,
    originCountry,
    timePosition,
    lastContact,
    longitude,
    latitude,
    baroAltitude,
    onGround,
    velocity,
    trueTrack,
    verticalRate,
    const DeepCollectionEquality().hash(_sensors),
    geoAltitude,
    squawk,
    spi,
    positionSource,
  );

  /// Create a copy of FlightModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightModelImplCopyWith<_$FlightModelImpl> get copyWith =>
      __$$FlightModelImplCopyWithImpl<_$FlightModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlightModelImplToJson(this);
  }
}

abstract class _FlightModel implements FlightModel {
  const factory _FlightModel({
    required final String icao24,
    final String? callsign,
    final String? originCountry,
    final int? timePosition,
    final int? lastContact,
    final double? longitude,
    final double? latitude,
    final double? baroAltitude,
    final bool? onGround,
    final double? velocity,
    final double? trueTrack,
    final double? verticalRate,
    final List<int>? sensors,
    final double? geoAltitude,
    final String? squawk,
    final bool? spi,
    final int? positionSource,
  }) = _$FlightModelImpl;

  factory _FlightModel.fromJson(Map<String, dynamic> json) =
      _$FlightModelImpl.fromJson;

  @override
  String get icao24;
  @override
  String? get callsign;
  @override
  String? get originCountry;
  @override
  int? get timePosition;
  @override
  int? get lastContact;
  @override
  double? get longitude;
  @override
  double? get latitude;
  @override
  double? get baroAltitude;
  @override
  bool? get onGround;
  @override
  double? get velocity;
  @override
  double? get trueTrack;
  @override
  double? get verticalRate;
  @override
  List<int>? get sensors;
  @override
  double? get geoAltitude;
  @override
  String? get squawk;
  @override
  bool? get spi;
  @override
  int? get positionSource;

  /// Create a copy of FlightModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlightModelImplCopyWith<_$FlightModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FlightResponse {
  int get time => throw _privateConstructorUsedError;
  List<FlightModel> get states => throw _privateConstructorUsedError;

  /// Create a copy of FlightResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlightResponseCopyWith<FlightResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightResponseCopyWith<$Res> {
  factory $FlightResponseCopyWith(
    FlightResponse value,
    $Res Function(FlightResponse) then,
  ) = _$FlightResponseCopyWithImpl<$Res, FlightResponse>;
  @useResult
  $Res call({int time, List<FlightModel> states});
}

/// @nodoc
class _$FlightResponseCopyWithImpl<$Res, $Val extends FlightResponse>
    implements $FlightResponseCopyWith<$Res> {
  _$FlightResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlightResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? time = null, Object? states = null}) {
    return _then(
      _value.copyWith(
            time:
                null == time
                    ? _value.time
                    : time // ignore: cast_nullable_to_non_nullable
                        as int,
            states:
                null == states
                    ? _value.states
                    : states // ignore: cast_nullable_to_non_nullable
                        as List<FlightModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FlightResponseImplCopyWith<$Res>
    implements $FlightResponseCopyWith<$Res> {
  factory _$$FlightResponseImplCopyWith(
    _$FlightResponseImpl value,
    $Res Function(_$FlightResponseImpl) then,
  ) = __$$FlightResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int time, List<FlightModel> states});
}

/// @nodoc
class __$$FlightResponseImplCopyWithImpl<$Res>
    extends _$FlightResponseCopyWithImpl<$Res, _$FlightResponseImpl>
    implements _$$FlightResponseImplCopyWith<$Res> {
  __$$FlightResponseImplCopyWithImpl(
    _$FlightResponseImpl _value,
    $Res Function(_$FlightResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FlightResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? time = null, Object? states = null}) {
    return _then(
      _$FlightResponseImpl(
        time:
            null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                    as int,
        states:
            null == states
                ? _value._states
                : states // ignore: cast_nullable_to_non_nullable
                    as List<FlightModel>,
      ),
    );
  }
}

/// @nodoc

class _$FlightResponseImpl implements _FlightResponse {
  const _$FlightResponseImpl({
    required this.time,
    required final List<FlightModel> states,
  }) : _states = states;

  @override
  final int time;
  final List<FlightModel> _states;
  @override
  List<FlightModel> get states {
    if (_states is EqualUnmodifiableListView) return _states;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_states);
  }

  @override
  String toString() {
    return 'FlightResponse(time: $time, states: $states)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlightResponseImpl &&
            (identical(other.time, time) || other.time == time) &&
            const DeepCollectionEquality().equals(other._states, _states));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    time,
    const DeepCollectionEquality().hash(_states),
  );

  /// Create a copy of FlightResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightResponseImplCopyWith<_$FlightResponseImpl> get copyWith =>
      __$$FlightResponseImplCopyWithImpl<_$FlightResponseImpl>(
        this,
        _$identity,
      );
}

abstract class _FlightResponse implements FlightResponse {
  const factory _FlightResponse({
    required final int time,
    required final List<FlightModel> states,
  }) = _$FlightResponseImpl;

  @override
  int get time;
  @override
  List<FlightModel> get states;

  /// Create a copy of FlightResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlightResponseImplCopyWith<_$FlightResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

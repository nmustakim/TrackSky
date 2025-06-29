// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlightModelImpl _$$FlightModelImplFromJson(Map<String, dynamic> json) =>
    _$FlightModelImpl(
      icao24: json['icao24'] as String,
      callsign: json['callsign'] as String?,
      originCountry: json['originCountry'] as String?,
      timePosition: (json['timePosition'] as num?)?.toInt(),
      lastContact: (json['lastContact'] as num?)?.toInt(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      baroAltitude: (json['baroAltitude'] as num?)?.toDouble(),
      onGround: json['onGround'] as bool?,
      velocity: (json['velocity'] as num?)?.toDouble(),
      trueTrack: (json['trueTrack'] as num?)?.toDouble(),
      verticalRate: (json['verticalRate'] as num?)?.toDouble(),
      sensors:
          (json['sensors'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList(),
      geoAltitude: (json['geoAltitude'] as num?)?.toDouble(),
      squawk: json['squawk'] as String?,
      spi: json['spi'] as bool?,
      positionSource: (json['positionSource'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FlightModelImplToJson(_$FlightModelImpl instance) =>
    <String, dynamic>{
      'icao24': instance.icao24,
      'callsign': instance.callsign,
      'originCountry': instance.originCountry,
      'timePosition': instance.timePosition,
      'lastContact': instance.lastContact,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'baroAltitude': instance.baroAltitude,
      'onGround': instance.onGround,
      'velocity': instance.velocity,
      'trueTrack': instance.trueTrack,
      'verticalRate': instance.verticalRate,
      'sensors': instance.sensors,
      'geoAltitude': instance.geoAltitude,
      'squawk': instance.squawk,
      'spi': instance.spi,
      'positionSource': instance.positionSource,
    };

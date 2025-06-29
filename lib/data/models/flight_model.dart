import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_model.freezed.dart';
part 'flight_model.g.dart';

@freezed
class FlightModel with _$FlightModel {
  const factory FlightModel({
    required String icao24,
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
  }) = _FlightModel;

  factory FlightModel.fromJson(Map<String, dynamic> json) =>
      _$FlightModelFromJson(json);

  factory FlightModel.fromList(List<dynamic> data) {
    return FlightModel(
      icao24: data[0] ?? '',
      callsign: data[1]?.toString().trim(),
      originCountry: data[2],
      timePosition: data[3]?.toInt(),
      lastContact: data[4]?.toInt(),
      longitude: data[5]?.toDouble(),
      latitude: data[6]?.toDouble(),
      baroAltitude: data[7]?.toDouble(),
      onGround: data[8],
      velocity: data[9]?.toDouble(),
      trueTrack: data[10]?.toDouble(),
      verticalRate: data[11]?.toDouble(),
      sensors: data[12]?.cast<int>(),
      geoAltitude: data[13]?.toDouble(),
      squawk: data[14],
      spi: data[15],
      positionSource: data[16]?.toInt(),
    );
  }
}

@freezed
class FlightResponse with _$FlightResponse {
  const factory FlightResponse({
    required int time,
    required List<FlightModel> states,
  }) = _FlightResponse;

  factory FlightResponse.fromJson(Map<String, dynamic> json) {
    return FlightResponse(
      time: json['time'],
      states: (json['states'] as List?)
          ?.map((e) => FlightModel.fromList(e))
          .toList() ??
          [],
    );
  }
}
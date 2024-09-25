// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlantModelAdapter extends TypeAdapter<PlantModel> {
  @override
  final int typeId = 0;

  @override
  PlantModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlantModel(
      image: fields[8] as String?,
      id: fields[7] as String?,
      name: fields[0] as String?,
      description: fields[1] as String?,
      temperature: fields[4] as int?,
      humidity: fields[5] as PlantHumidity,
      isFavorite: fields[9] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PlantModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.temperature)
      ..writeByte(5)
      ..write(obj.humidity)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.image)
      ..writeByte(9)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlantModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PlantHumidityAdapter extends TypeAdapter<PlantHumidity> {
  @override
  final int typeId = 1;

  @override
  PlantHumidity read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PlantHumidity.high;
      case 1:
        return PlantHumidity.highDescr;
      case 2:
        return PlantHumidity.medium;
      case 3:
        return PlantHumidity.mediumDescr;
      case 4:
        return PlantHumidity.low;
      case 5:
        return PlantHumidity.lowDescr;
      default:
        return PlantHumidity.high;
    }
  }

  @override
  void write(BinaryWriter writer, PlantHumidity obj) {
    switch (obj) {
      case PlantHumidity.high:
        writer.writeByte(0);
        break;
      case PlantHumidity.highDescr:
        writer.writeByte(1);
        break;
      case PlantHumidity.medium:
        writer.writeByte(2);
        break;
      case PlantHumidity.mediumDescr:
        writer.writeByte(3);
        break;
      case PlantHumidity.low:
        writer.writeByte(4);
        break;
      case PlantHumidity.lowDescr:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlantHumidityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

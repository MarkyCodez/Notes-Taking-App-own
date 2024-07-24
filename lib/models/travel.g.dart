// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TravelAdapter extends TypeAdapter<Travel> {
  @override
  final int typeId = 3;

  @override
  Travel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Travel(
      taskTitle: fields[0] as String,
      taskDescription: fields[1] as String,
      dateTime: fields[2] as DateTime,
      isCompleted: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Travel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.taskTitle)
      ..writeByte(1)
      ..write(obj.taskDescription)
      ..writeByte(2)
      ..write(obj.dateTime)
      ..writeByte(3)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TravelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

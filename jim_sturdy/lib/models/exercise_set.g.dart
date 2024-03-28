// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_set.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciseSetAdapter extends TypeAdapter<ExerciseSet> {
  @override
  final int typeId = 3;

  @override
  ExerciseSet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExerciseSet(
      reps: fields[0] as double?,
      measurement: fields[1] as dynamic,
      measurementType: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ExerciseSet obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.reps)
      ..writeByte(1)
      ..write(obj.measurement)
      ..writeByte(2)
      ..write(obj.measurementType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseSetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

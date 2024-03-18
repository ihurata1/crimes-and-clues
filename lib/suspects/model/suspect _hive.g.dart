// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suspect _hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SuspectHiveModelAdapter extends TypeAdapter<SuspectHiveModel> {
  @override
  final int typeId = 0;

  @override
  SuspectHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SuspectHiveModel(
      name: fields[0] as String?,
      age: fields[1] as String?,
      jobTitle: fields[2] as String?,
      relevance: fields[3] as String?,
      statement: fields[4] as String?,
      isGuilty: fields[6] as bool?,
      image: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SuspectHiveModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.jobTitle)
      ..writeByte(3)
      ..write(obj.relevance)
      ..writeByte(4)
      ..write(obj.statement)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.isGuilty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuspectHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

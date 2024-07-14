// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boid.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BoidAdapter extends TypeAdapter<Boid> {
  @override
  final int typeId = 0;

  @override
  Boid read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Boid(
      name: fields[0] as String,
      boidNumber: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Boid obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.boidNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BoidAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

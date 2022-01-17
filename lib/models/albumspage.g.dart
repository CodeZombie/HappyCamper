// GENERATED CODE - DO NOT MODIFY BY HAND

part of happycamper;

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlbumsPageAdapter extends TypeAdapter<AlbumsPage> {
  @override
  final int typeId = 1;

  @override
  AlbumsPage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlbumsPage(
      fields[0] as bool,
      fields[1] as int,
      (fields[2] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, AlbumsPage obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.moreAvailable)
      ..writeByte(1)
      ..write(obj.pageNumber)
      ..writeByte(2)
      ..write(obj.albumIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumsPageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

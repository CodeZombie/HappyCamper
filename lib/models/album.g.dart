// GENERATED CODE - DO NOT MODIFY BY HAND

part of happycamper;

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlbumAdapter extends TypeAdapter<Album> {
  @override
  final int typeId = 0;

  @override
  Album read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Album(
      fields[0] as String,
      fields[1] as String,
      fields[3] as String,
      fields[2] as String,
      (fields[4] as List)
          .map((dynamic e) => (e as Map).cast<dynamic, dynamic>())
          .toList(),
    );
  }

  @override
  void write(BinaryWriter writer, Album obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.artist)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.albumArtId)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.tracks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

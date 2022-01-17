// GENERATED CODE - DO NOT MODIFY BY HAND

part of happycamper;

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TagSearchResultAdapter extends TypeAdapter<TagSearchResult> {
  @override
  final int typeId = 3;

  @override
  TagSearchResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TagSearchResult(
      fields[0] as String,
      (fields[1] as List).cast<Tag>(),
    );
  }

  @override
  void write(BinaryWriter writer, TagSearchResult obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.searchTerm)
      ..writeByte(1)
      ..write(obj.tags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TagSearchResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

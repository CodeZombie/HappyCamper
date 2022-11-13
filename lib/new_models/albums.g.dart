// GENERATED CODE - DO NOT MODIFY BY HAND

part of happycamper;

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAlbumsCollection on Isar {
  IsarCollection<Albums> get albums => this.collection();
}

const AlbumsSchema = CollectionSchema(
  name: r'Albums',
  id: 3797381526277860700,
  properties: {
    r'albumIds': PropertySchema(
      id: 0,
      name: r'albumIds',
      type: IsarType.longList,
    ),
    r'moreAvailable': PropertySchema(
      id: 1,
      name: r'moreAvailable',
      type: IsarType.bool,
    ),
    r'pageNumber': PropertySchema(
      id: 2,
      name: r'pageNumber',
      type: IsarType.long,
    ),
    r'tagNames': PropertySchema(
      id: 3,
      name: r'tagNames',
      type: IsarType.stringList,
    ),
    r'visitedPageNumbers': PropertySchema(
      id: 4,
      name: r'visitedPageNumbers',
      type: IsarType.longList,
    )
  },
  estimateSize: _albumsEstimateSize,
  serialize: _albumsSerialize,
  deserialize: _albumsDeserialize,
  deserializeProp: _albumsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _albumsGetId,
  getLinks: _albumsGetLinks,
  attach: _albumsAttach,
  version: '3.0.3',
);

int _albumsEstimateSize(
  Albums object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.albumIds.length * 8;
  bytesCount += 3 + object.tagNames.length * 3;
  {
    for (var i = 0; i < object.tagNames.length; i++) {
      final value = object.tagNames[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.visitedPageNumbers.length * 8;
  return bytesCount;
}

void _albumsSerialize(
  Albums object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.albumIds);
  writer.writeBool(offsets[1], object.moreAvailable);
  writer.writeLong(offsets[2], object.pageNumber);
  writer.writeStringList(offsets[3], object.tagNames);
  writer.writeLongList(offsets[4], object.visitedPageNumbers);
}

Albums _albumsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Albums(
    reader.readStringList(offsets[3]) ?? [],
  );
  object.albumIds = reader.readLongList(offsets[0]) ?? [];
  object.moreAvailable = reader.readBool(offsets[1]);
  object.pageNumber = reader.readLong(offsets[2]);
  object.visitedPageNumbers = reader.readLongList(offsets[4]) ?? [];
  return object;
}

P _albumsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongList(offset) ?? []) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readLongList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _albumsGetId(Albums object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _albumsGetLinks(Albums object) {
  return [];
}

void _albumsAttach(IsarCollection<dynamic> col, Id id, Albums object) {}

extension AlbumsQueryWhereSort on QueryBuilder<Albums, Albums, QWhere> {
  QueryBuilder<Albums, Albums, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AlbumsQueryWhere on QueryBuilder<Albums, Albums, QWhereClause> {
  QueryBuilder<Albums, Albums, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Albums, Albums, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Albums, Albums, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Albums, Albums, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AlbumsQueryFilter on QueryBuilder<Albums, Albums, QFilterCondition> {
  QueryBuilder<Albums, Albums, QAfterFilterCondition> albumIdsElementEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'albumIds',
        value: value,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition>
      albumIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'albumIds',
        value: value,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> albumIdsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'albumIds',
        value: value,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> albumIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'albumIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> albumIdsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'albumIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> albumIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'albumIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> albumIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'albumIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> albumIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'albumIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> albumIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'albumIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> albumIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'albumIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> moreAvailableEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'moreAvailable',
        value: value,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> pageNumberEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pageNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> pageNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pageNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> pageNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pageNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> pageNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pageNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> tagNamesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tagNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition>
      tagNamesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tagNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> tagNamesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tagNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> tagNamesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tagNames',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> tagNamesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tagNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> tagNamesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tagNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> tagNamesElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tagNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> tagNamesElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tagNames',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> tagNamesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tagNames',
        value: '',
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition>
      tagNamesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tagNames',
        value: '',
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> tagNamesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagNames',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> tagNamesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagNames',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> tagNamesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagNames',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> tagNamesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagNames',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> tagNamesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagNames',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition> tagNamesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagNames',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition>
      visitedPageNumbersElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visitedPageNumbers',
        value: value,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition>
      visitedPageNumbersElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'visitedPageNumbers',
        value: value,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition>
      visitedPageNumbersElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'visitedPageNumbers',
        value: value,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition>
      visitedPageNumbersElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'visitedPageNumbers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition>
      visitedPageNumbersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visitedPageNumbers',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition>
      visitedPageNumbersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visitedPageNumbers',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition>
      visitedPageNumbersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visitedPageNumbers',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition>
      visitedPageNumbersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visitedPageNumbers',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition>
      visitedPageNumbersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visitedPageNumbers',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Albums, Albums, QAfterFilterCondition>
      visitedPageNumbersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'visitedPageNumbers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension AlbumsQueryObject on QueryBuilder<Albums, Albums, QFilterCondition> {}

extension AlbumsQueryLinks on QueryBuilder<Albums, Albums, QFilterCondition> {}

extension AlbumsQuerySortBy on QueryBuilder<Albums, Albums, QSortBy> {
  QueryBuilder<Albums, Albums, QAfterSortBy> sortByMoreAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moreAvailable', Sort.asc);
    });
  }

  QueryBuilder<Albums, Albums, QAfterSortBy> sortByMoreAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moreAvailable', Sort.desc);
    });
  }

  QueryBuilder<Albums, Albums, QAfterSortBy> sortByPageNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pageNumber', Sort.asc);
    });
  }

  QueryBuilder<Albums, Albums, QAfterSortBy> sortByPageNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pageNumber', Sort.desc);
    });
  }
}

extension AlbumsQuerySortThenBy on QueryBuilder<Albums, Albums, QSortThenBy> {
  QueryBuilder<Albums, Albums, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Albums, Albums, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Albums, Albums, QAfterSortBy> thenByMoreAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moreAvailable', Sort.asc);
    });
  }

  QueryBuilder<Albums, Albums, QAfterSortBy> thenByMoreAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moreAvailable', Sort.desc);
    });
  }

  QueryBuilder<Albums, Albums, QAfterSortBy> thenByPageNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pageNumber', Sort.asc);
    });
  }

  QueryBuilder<Albums, Albums, QAfterSortBy> thenByPageNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pageNumber', Sort.desc);
    });
  }
}

extension AlbumsQueryWhereDistinct on QueryBuilder<Albums, Albums, QDistinct> {
  QueryBuilder<Albums, Albums, QDistinct> distinctByAlbumIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'albumIds');
    });
  }

  QueryBuilder<Albums, Albums, QDistinct> distinctByMoreAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'moreAvailable');
    });
  }

  QueryBuilder<Albums, Albums, QDistinct> distinctByPageNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pageNumber');
    });
  }

  QueryBuilder<Albums, Albums, QDistinct> distinctByTagNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tagNames');
    });
  }

  QueryBuilder<Albums, Albums, QDistinct> distinctByVisitedPageNumbers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visitedPageNumbers');
    });
  }
}

extension AlbumsQueryProperty on QueryBuilder<Albums, Albums, QQueryProperty> {
  QueryBuilder<Albums, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Albums, List<int>, QQueryOperations> albumIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'albumIds');
    });
  }

  QueryBuilder<Albums, bool, QQueryOperations> moreAvailableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moreAvailable');
    });
  }

  QueryBuilder<Albums, int, QQueryOperations> pageNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pageNumber');
    });
  }

  QueryBuilder<Albums, List<String>, QQueryOperations> tagNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tagNames');
    });
  }

  QueryBuilder<Albums, List<int>, QQueryOperations>
      visitedPageNumbersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visitedPageNumbers');
    });
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tagsearchresults.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetTagSearchResultsCollection on Isar {
  IsarCollection<TagSearchResults> get tagSearchResults => this.collection();
}

const TagSearchResultsSchema = CollectionSchema(
  name: r'TagSearchResults',
  id: 8358030109740694774,
  properties: {
    r'searchTerm': PropertySchema(
      id: 0,
      name: r'searchTerm',
      type: IsarType.string,
    ),
    r'tagIds': PropertySchema(
      id: 1,
      name: r'tagIds',
      type: IsarType.longList,
    )
  },
  estimateSize: _tagSearchResultsEstimateSize,
  serialize: _tagSearchResultsSerialize,
  deserialize: _tagSearchResultsDeserialize,
  deserializeProp: _tagSearchResultsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _tagSearchResultsGetId,
  getLinks: _tagSearchResultsGetLinks,
  attach: _tagSearchResultsAttach,
  version: '3.0.3',
);

int _tagSearchResultsEstimateSize(
  TagSearchResults object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.searchTerm.length * 3;
  bytesCount += 3 + object.tagIds.length * 8;
  return bytesCount;
}

void _tagSearchResultsSerialize(
  TagSearchResults object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.searchTerm);
  writer.writeLongList(offsets[1], object.tagIds);
}

TagSearchResults _tagSearchResultsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TagSearchResults(
    reader.readString(offsets[0]),
    reader.readLongList(offsets[1]) ?? [],
  );
  return object;
}

P _tagSearchResultsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLongList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _tagSearchResultsGetId(TagSearchResults object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _tagSearchResultsGetLinks(TagSearchResults object) {
  return [];
}

void _tagSearchResultsAttach(
    IsarCollection<dynamic> col, Id id, TagSearchResults object) {}

extension TagSearchResultsQueryWhereSort
    on QueryBuilder<TagSearchResults, TagSearchResults, QWhere> {
  QueryBuilder<TagSearchResults, TagSearchResults, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TagSearchResultsQueryWhere
    on QueryBuilder<TagSearchResults, TagSearchResults, QWhereClause> {
  QueryBuilder<TagSearchResults, TagSearchResults, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterWhereClause> idBetween(
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

extension TagSearchResultsQueryFilter
    on QueryBuilder<TagSearchResults, TagSearchResults, QFilterCondition> {
  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      searchTermEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'searchTerm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      searchTermGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'searchTerm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      searchTermLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'searchTerm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      searchTermBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'searchTerm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      searchTermStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'searchTerm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      searchTermEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'searchTerm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      searchTermContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'searchTerm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      searchTermMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'searchTerm',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      searchTermIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'searchTerm',
        value: '',
      ));
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      searchTermIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'searchTerm',
        value: '',
      ));
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      tagIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tagIds',
        value: value,
      ));
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      tagIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tagIds',
        value: value,
      ));
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      tagIdsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tagIds',
        value: value,
      ));
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      tagIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tagIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      tagIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      tagIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      tagIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      tagIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      tagIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterFilterCondition>
      tagIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tagIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension TagSearchResultsQueryObject
    on QueryBuilder<TagSearchResults, TagSearchResults, QFilterCondition> {}

extension TagSearchResultsQueryLinks
    on QueryBuilder<TagSearchResults, TagSearchResults, QFilterCondition> {}

extension TagSearchResultsQuerySortBy
    on QueryBuilder<TagSearchResults, TagSearchResults, QSortBy> {
  QueryBuilder<TagSearchResults, TagSearchResults, QAfterSortBy>
      sortBySearchTerm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchTerm', Sort.asc);
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterSortBy>
      sortBySearchTermDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchTerm', Sort.desc);
    });
  }
}

extension TagSearchResultsQuerySortThenBy
    on QueryBuilder<TagSearchResults, TagSearchResults, QSortThenBy> {
  QueryBuilder<TagSearchResults, TagSearchResults, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterSortBy>
      thenBySearchTerm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchTerm', Sort.asc);
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QAfterSortBy>
      thenBySearchTermDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchTerm', Sort.desc);
    });
  }
}

extension TagSearchResultsQueryWhereDistinct
    on QueryBuilder<TagSearchResults, TagSearchResults, QDistinct> {
  QueryBuilder<TagSearchResults, TagSearchResults, QDistinct>
      distinctBySearchTerm({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'searchTerm', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TagSearchResults, TagSearchResults, QDistinct>
      distinctByTagIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tagIds');
    });
  }
}

extension TagSearchResultsQueryProperty
    on QueryBuilder<TagSearchResults, TagSearchResults, QQueryProperty> {
  QueryBuilder<TagSearchResults, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TagSearchResults, String, QQueryOperations>
      searchTermProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'searchTerm');
    });
  }

  QueryBuilder<TagSearchResults, List<int>, QQueryOperations> tagIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tagIds');
    });
  }
}

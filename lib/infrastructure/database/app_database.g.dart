// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<Setting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final String key;
  final String value;
  const Setting({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      key: Value(key),
      value: Value(value),
    );
  }

  factory Setting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  Setting copyWith({String? key, String? value}) => Setting(
        key: key ?? this.key,
        value: value ?? this.value,
      );
  Setting copyWithCompanion(SettingsCompanion data) {
    return Setting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting && other.key == this.key && other.value == this.value);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const SettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  })  : key = Value(key),
        value = Value(value);
  static Insertable<Setting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsCompanion copyWith(
      {Value<String>? key, Value<String>? value, Value<int>? rowid}) {
    return SettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DealsTable extends Deals with TableInfo<$DealsTable, Deal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DealsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _thumbnailMeta =
      const VerificationMeta('thumbnail');
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
      'thumbnail', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
      'rating', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<int> releaseDate = GeneratedColumn<int>(
      'release_date', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _metacriticLinkMeta =
      const VerificationMeta('metacriticLink');
  @override
  late final GeneratedColumn<String> metacriticLink = GeneratedColumn<String>(
      'metacritic_link', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, price, thumbnail, rating, releaseDate, metacriticLink];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'deals';
  @override
  VerificationContext validateIntegrity(Insertable<Deal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('thumbnail')) {
      context.handle(_thumbnailMeta,
          thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta));
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    }
    if (data.containsKey('metacritic_link')) {
      context.handle(
          _metacriticLinkMeta,
          metacriticLink.isAcceptableOrUnknown(
              data['metacritic_link']!, _metacriticLinkMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Deal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Deal(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      thumbnail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}thumbnail']),
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rating']),
      releaseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}release_date']),
      metacriticLink: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}metacritic_link']),
    );
  }

  @override
  $DealsTable createAlias(String alias) {
    return $DealsTable(attachedDatabase, alias);
  }
}

class Deal extends DataClass implements Insertable<Deal> {
  final String id;
  final String title;
  final double price;
  final String? thumbnail;
  final double? rating;
  final int? releaseDate;
  final String? metacriticLink;
  const Deal(
      {required this.id,
      required this.title,
      required this.price,
      this.thumbnail,
      this.rating,
      this.releaseDate,
      this.metacriticLink});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['price'] = Variable<double>(price);
    if (!nullToAbsent || thumbnail != null) {
      map['thumbnail'] = Variable<String>(thumbnail);
    }
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<double>(rating);
    }
    if (!nullToAbsent || releaseDate != null) {
      map['release_date'] = Variable<int>(releaseDate);
    }
    if (!nullToAbsent || metacriticLink != null) {
      map['metacritic_link'] = Variable<String>(metacriticLink);
    }
    return map;
  }

  DealsCompanion toCompanion(bool nullToAbsent) {
    return DealsCompanion(
      id: Value(id),
      title: Value(title),
      price: Value(price),
      thumbnail: thumbnail == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnail),
      rating:
          rating == null && nullToAbsent ? const Value.absent() : Value(rating),
      releaseDate: releaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseDate),
      metacriticLink: metacriticLink == null && nullToAbsent
          ? const Value.absent()
          : Value(metacriticLink),
    );
  }

  factory Deal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Deal(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      price: serializer.fromJson<double>(json['price']),
      thumbnail: serializer.fromJson<String?>(json['thumbnail']),
      rating: serializer.fromJson<double?>(json['rating']),
      releaseDate: serializer.fromJson<int?>(json['releaseDate']),
      metacriticLink: serializer.fromJson<String?>(json['metacriticLink']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'price': serializer.toJson<double>(price),
      'thumbnail': serializer.toJson<String?>(thumbnail),
      'rating': serializer.toJson<double?>(rating),
      'releaseDate': serializer.toJson<int?>(releaseDate),
      'metacriticLink': serializer.toJson<String?>(metacriticLink),
    };
  }

  Deal copyWith(
          {String? id,
          String? title,
          double? price,
          Value<String?> thumbnail = const Value.absent(),
          Value<double?> rating = const Value.absent(),
          Value<int?> releaseDate = const Value.absent(),
          Value<String?> metacriticLink = const Value.absent()}) =>
      Deal(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        thumbnail: thumbnail.present ? thumbnail.value : this.thumbnail,
        rating: rating.present ? rating.value : this.rating,
        releaseDate: releaseDate.present ? releaseDate.value : this.releaseDate,
        metacriticLink:
            metacriticLink.present ? metacriticLink.value : this.metacriticLink,
      );
  Deal copyWithCompanion(DealsCompanion data) {
    return Deal(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      price: data.price.present ? data.price.value : this.price,
      thumbnail: data.thumbnail.present ? data.thumbnail.value : this.thumbnail,
      rating: data.rating.present ? data.rating.value : this.rating,
      releaseDate:
          data.releaseDate.present ? data.releaseDate.value : this.releaseDate,
      metacriticLink: data.metacriticLink.present
          ? data.metacriticLink.value
          : this.metacriticLink,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Deal(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('price: $price, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('rating: $rating, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('metacriticLink: $metacriticLink')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, price, thumbnail, rating, releaseDate, metacriticLink);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Deal &&
          other.id == this.id &&
          other.title == this.title &&
          other.price == this.price &&
          other.thumbnail == this.thumbnail &&
          other.rating == this.rating &&
          other.releaseDate == this.releaseDate &&
          other.metacriticLink == this.metacriticLink);
}

class DealsCompanion extends UpdateCompanion<Deal> {
  final Value<String> id;
  final Value<String> title;
  final Value<double> price;
  final Value<String?> thumbnail;
  final Value<double?> rating;
  final Value<int?> releaseDate;
  final Value<String?> metacriticLink;
  final Value<int> rowid;
  const DealsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.price = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.rating = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.metacriticLink = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DealsCompanion.insert({
    required String id,
    required String title,
    required double price,
    this.thumbnail = const Value.absent(),
    this.rating = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.metacriticLink = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        price = Value(price);
  static Insertable<Deal> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<double>? price,
    Expression<String>? thumbnail,
    Expression<double>? rating,
    Expression<int>? releaseDate,
    Expression<String>? metacriticLink,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (price != null) 'price': price,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (rating != null) 'rating': rating,
      if (releaseDate != null) 'release_date': releaseDate,
      if (metacriticLink != null) 'metacritic_link': metacriticLink,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DealsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<double>? price,
      Value<String?>? thumbnail,
      Value<double?>? rating,
      Value<int?>? releaseDate,
      Value<String?>? metacriticLink,
      Value<int>? rowid}) {
    return DealsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      thumbnail: thumbnail ?? this.thumbnail,
      rating: rating ?? this.rating,
      releaseDate: releaseDate ?? this.releaseDate,
      metacriticLink: metacriticLink ?? this.metacriticLink,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<int>(releaseDate.value);
    }
    if (metacriticLink.present) {
      map['metacritic_link'] = Variable<String>(metacriticLink.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DealsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('price: $price, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('rating: $rating, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('metacriticLink: $metacriticLink, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LikedDealsTable extends LikedDeals
    with TableInfo<$LikedDealsTable, LikedDeal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LikedDealsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dealIdMeta = const VerificationMeta('dealId');
  @override
  late final GeneratedColumn<String> dealId = GeneratedColumn<String>(
      'deal_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isLikedMeta =
      const VerificationMeta('isLiked');
  @override
  late final GeneratedColumn<bool> isLiked = GeneratedColumn<bool>(
      'is_liked', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_liked" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [dealId, isLiked];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'liked_deals';
  @override
  VerificationContext validateIntegrity(Insertable<LikedDeal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('deal_id')) {
      context.handle(_dealIdMeta,
          dealId.isAcceptableOrUnknown(data['deal_id']!, _dealIdMeta));
    } else if (isInserting) {
      context.missing(_dealIdMeta);
    }
    if (data.containsKey('is_liked')) {
      context.handle(_isLikedMeta,
          isLiked.isAcceptableOrUnknown(data['is_liked']!, _isLikedMeta));
    } else if (isInserting) {
      context.missing(_isLikedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {dealId};
  @override
  LikedDeal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LikedDeal(
      dealId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}deal_id'])!,
      isLiked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_liked'])!,
    );
  }

  @override
  $LikedDealsTable createAlias(String alias) {
    return $LikedDealsTable(attachedDatabase, alias);
  }
}

class LikedDeal extends DataClass implements Insertable<LikedDeal> {
  final String dealId;
  final bool isLiked;
  const LikedDeal({required this.dealId, required this.isLiked});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['deal_id'] = Variable<String>(dealId);
    map['is_liked'] = Variable<bool>(isLiked);
    return map;
  }

  LikedDealsCompanion toCompanion(bool nullToAbsent) {
    return LikedDealsCompanion(
      dealId: Value(dealId),
      isLiked: Value(isLiked),
    );
  }

  factory LikedDeal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LikedDeal(
      dealId: serializer.fromJson<String>(json['dealId']),
      isLiked: serializer.fromJson<bool>(json['isLiked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dealId': serializer.toJson<String>(dealId),
      'isLiked': serializer.toJson<bool>(isLiked),
    };
  }

  LikedDeal copyWith({String? dealId, bool? isLiked}) => LikedDeal(
        dealId: dealId ?? this.dealId,
        isLiked: isLiked ?? this.isLiked,
      );
  LikedDeal copyWithCompanion(LikedDealsCompanion data) {
    return LikedDeal(
      dealId: data.dealId.present ? data.dealId.value : this.dealId,
      isLiked: data.isLiked.present ? data.isLiked.value : this.isLiked,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LikedDeal(')
          ..write('dealId: $dealId, ')
          ..write('isLiked: $isLiked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(dealId, isLiked);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LikedDeal &&
          other.dealId == this.dealId &&
          other.isLiked == this.isLiked);
}

class LikedDealsCompanion extends UpdateCompanion<LikedDeal> {
  final Value<String> dealId;
  final Value<bool> isLiked;
  final Value<int> rowid;
  const LikedDealsCompanion({
    this.dealId = const Value.absent(),
    this.isLiked = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LikedDealsCompanion.insert({
    required String dealId,
    required bool isLiked,
    this.rowid = const Value.absent(),
  })  : dealId = Value(dealId),
        isLiked = Value(isLiked);
  static Insertable<LikedDeal> custom({
    Expression<String>? dealId,
    Expression<bool>? isLiked,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dealId != null) 'deal_id': dealId,
      if (isLiked != null) 'is_liked': isLiked,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LikedDealsCompanion copyWith(
      {Value<String>? dealId, Value<bool>? isLiked, Value<int>? rowid}) {
    return LikedDealsCompanion(
      dealId: dealId ?? this.dealId,
      isLiked: isLiked ?? this.isLiked,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dealId.present) {
      map['deal_id'] = Variable<String>(dealId.value);
    }
    if (isLiked.present) {
      map['is_liked'] = Variable<bool>(isLiked.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LikedDealsCompanion(')
          ..write('dealId: $dealId, ')
          ..write('isLiked: $isLiked, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $DealsTable deals = $DealsTable(this);
  late final $LikedDealsTable likedDeals = $LikedDealsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [settings, deals, likedDeals];
}

typedef $$SettingsTableCreateCompanionBuilder = SettingsCompanion Function({
  required String key,
  required String value,
  Value<int> rowid,
});
typedef $$SettingsTableUpdateCompanionBuilder = SettingsCompanion Function({
  Value<String> key,
  Value<String> value,
  Value<int> rowid,
});

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$SettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SettingsTable,
    Setting,
    $$SettingsTableFilterComposer,
    $$SettingsTableOrderingComposer,
    $$SettingsTableAnnotationComposer,
    $$SettingsTableCreateCompanionBuilder,
    $$SettingsTableUpdateCompanionBuilder,
    (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
    Setting,
    PrefetchHooks Function()> {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SettingsCompanion(
            key: key,
            value: value,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String key,
            required String value,
            Value<int> rowid = const Value.absent(),
          }) =>
              SettingsCompanion.insert(
            key: key,
            value: value,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SettingsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SettingsTable,
    Setting,
    $$SettingsTableFilterComposer,
    $$SettingsTableOrderingComposer,
    $$SettingsTableAnnotationComposer,
    $$SettingsTableCreateCompanionBuilder,
    $$SettingsTableUpdateCompanionBuilder,
    (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
    Setting,
    PrefetchHooks Function()>;
typedef $$DealsTableCreateCompanionBuilder = DealsCompanion Function({
  required String id,
  required String title,
  required double price,
  Value<String?> thumbnail,
  Value<double?> rating,
  Value<int?> releaseDate,
  Value<String?> metacriticLink,
  Value<int> rowid,
});
typedef $$DealsTableUpdateCompanionBuilder = DealsCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<double> price,
  Value<String?> thumbnail,
  Value<double?> rating,
  Value<int?> releaseDate,
  Value<String?> metacriticLink,
  Value<int> rowid,
});

class $$DealsTableFilterComposer extends Composer<_$AppDatabase, $DealsTable> {
  $$DealsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get thumbnail => $composableBuilder(
      column: $table.thumbnail, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get metacriticLink => $composableBuilder(
      column: $table.metacriticLink,
      builder: (column) => ColumnFilters(column));
}

class $$DealsTableOrderingComposer
    extends Composer<_$AppDatabase, $DealsTable> {
  $$DealsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get thumbnail => $composableBuilder(
      column: $table.thumbnail, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get metacriticLink => $composableBuilder(
      column: $table.metacriticLink,
      builder: (column) => ColumnOrderings(column));
}

class $$DealsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DealsTable> {
  $$DealsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get thumbnail =>
      $composableBuilder(column: $table.thumbnail, builder: (column) => column);

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<int> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => column);

  GeneratedColumn<String> get metacriticLink => $composableBuilder(
      column: $table.metacriticLink, builder: (column) => column);
}

class $$DealsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DealsTable,
    Deal,
    $$DealsTableFilterComposer,
    $$DealsTableOrderingComposer,
    $$DealsTableAnnotationComposer,
    $$DealsTableCreateCompanionBuilder,
    $$DealsTableUpdateCompanionBuilder,
    (Deal, BaseReferences<_$AppDatabase, $DealsTable, Deal>),
    Deal,
    PrefetchHooks Function()> {
  $$DealsTableTableManager(_$AppDatabase db, $DealsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DealsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DealsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DealsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<String?> thumbnail = const Value.absent(),
            Value<double?> rating = const Value.absent(),
            Value<int?> releaseDate = const Value.absent(),
            Value<String?> metacriticLink = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DealsCompanion(
            id: id,
            title: title,
            price: price,
            thumbnail: thumbnail,
            rating: rating,
            releaseDate: releaseDate,
            metacriticLink: metacriticLink,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required double price,
            Value<String?> thumbnail = const Value.absent(),
            Value<double?> rating = const Value.absent(),
            Value<int?> releaseDate = const Value.absent(),
            Value<String?> metacriticLink = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DealsCompanion.insert(
            id: id,
            title: title,
            price: price,
            thumbnail: thumbnail,
            rating: rating,
            releaseDate: releaseDate,
            metacriticLink: metacriticLink,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DealsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DealsTable,
    Deal,
    $$DealsTableFilterComposer,
    $$DealsTableOrderingComposer,
    $$DealsTableAnnotationComposer,
    $$DealsTableCreateCompanionBuilder,
    $$DealsTableUpdateCompanionBuilder,
    (Deal, BaseReferences<_$AppDatabase, $DealsTable, Deal>),
    Deal,
    PrefetchHooks Function()>;
typedef $$LikedDealsTableCreateCompanionBuilder = LikedDealsCompanion Function({
  required String dealId,
  required bool isLiked,
  Value<int> rowid,
});
typedef $$LikedDealsTableUpdateCompanionBuilder = LikedDealsCompanion Function({
  Value<String> dealId,
  Value<bool> isLiked,
  Value<int> rowid,
});

class $$LikedDealsTableFilterComposer
    extends Composer<_$AppDatabase, $LikedDealsTable> {
  $$LikedDealsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get dealId => $composableBuilder(
      column: $table.dealId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isLiked => $composableBuilder(
      column: $table.isLiked, builder: (column) => ColumnFilters(column));
}

class $$LikedDealsTableOrderingComposer
    extends Composer<_$AppDatabase, $LikedDealsTable> {
  $$LikedDealsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get dealId => $composableBuilder(
      column: $table.dealId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isLiked => $composableBuilder(
      column: $table.isLiked, builder: (column) => ColumnOrderings(column));
}

class $$LikedDealsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LikedDealsTable> {
  $$LikedDealsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get dealId =>
      $composableBuilder(column: $table.dealId, builder: (column) => column);

  GeneratedColumn<bool> get isLiked =>
      $composableBuilder(column: $table.isLiked, builder: (column) => column);
}

class $$LikedDealsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LikedDealsTable,
    LikedDeal,
    $$LikedDealsTableFilterComposer,
    $$LikedDealsTableOrderingComposer,
    $$LikedDealsTableAnnotationComposer,
    $$LikedDealsTableCreateCompanionBuilder,
    $$LikedDealsTableUpdateCompanionBuilder,
    (LikedDeal, BaseReferences<_$AppDatabase, $LikedDealsTable, LikedDeal>),
    LikedDeal,
    PrefetchHooks Function()> {
  $$LikedDealsTableTableManager(_$AppDatabase db, $LikedDealsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LikedDealsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LikedDealsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LikedDealsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> dealId = const Value.absent(),
            Value<bool> isLiked = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LikedDealsCompanion(
            dealId: dealId,
            isLiked: isLiked,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String dealId,
            required bool isLiked,
            Value<int> rowid = const Value.absent(),
          }) =>
              LikedDealsCompanion.insert(
            dealId: dealId,
            isLiked: isLiked,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LikedDealsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LikedDealsTable,
    LikedDeal,
    $$LikedDealsTableFilterComposer,
    $$LikedDealsTableOrderingComposer,
    $$LikedDealsTableAnnotationComposer,
    $$LikedDealsTableCreateCompanionBuilder,
    $$LikedDealsTableUpdateCompanionBuilder,
    (LikedDeal, BaseReferences<_$AppDatabase, $LikedDealsTable, LikedDeal>),
    LikedDeal,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
  $$DealsTableTableManager get deals =>
      $$DealsTableTableManager(_db, _db.deals);
  $$LikedDealsTableTableManager get likedDeals =>
      $$LikedDealsTableTableManager(_db, _db.likedDeals);
}

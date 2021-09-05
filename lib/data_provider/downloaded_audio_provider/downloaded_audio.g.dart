// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloaded_audio.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DownloadedAudio extends DataClass implements Insertable<DownloadedAudio> {
  final String id;
  final String name;
  final String url;
  final String? image;
  final int? numberOfListeners;
  final String channelName;
  final String description;
  final String localFilePath;
  DownloadedAudio(
      {required this.id,
      required this.name,
      required this.url,
      this.image,
      this.numberOfListeners,
      required this.channelName,
      required this.description,
      required this.localFilePath});
  factory DownloadedAudio.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DownloadedAudio(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image']),
      numberOfListeners: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}number_of_listeners']),
      channelName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}channel_name'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      localFilePath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}local_file_path'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['url'] = Variable<String>(url);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String?>(image);
    }
    if (!nullToAbsent || numberOfListeners != null) {
      map['number_of_listeners'] = Variable<int?>(numberOfListeners);
    }
    map['channel_name'] = Variable<String>(channelName);
    map['description'] = Variable<String>(description);
    map['local_file_path'] = Variable<String>(localFilePath);
    return map;
  }

  DownloadedAudiosCompanion toCompanion(bool nullToAbsent) {
    return DownloadedAudiosCompanion(
      id: Value(id),
      name: Value(name),
      url: Value(url),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      numberOfListeners: numberOfListeners == null && nullToAbsent
          ? const Value.absent()
          : Value(numberOfListeners),
      channelName: Value(channelName),
      description: Value(description),
      localFilePath: Value(localFilePath),
    );
  }

  factory DownloadedAudio.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DownloadedAudio(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      url: serializer.fromJson<String>(json['url']),
      image: serializer.fromJson<String?>(json['image']),
      numberOfListeners: serializer.fromJson<int?>(json['numberOfListeners']),
      channelName: serializer.fromJson<String>(json['channelName']),
      description: serializer.fromJson<String>(json['description']),
      localFilePath: serializer.fromJson<String>(json['localFilePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'url': serializer.toJson<String>(url),
      'image': serializer.toJson<String?>(image),
      'numberOfListeners': serializer.toJson<int?>(numberOfListeners),
      'channelName': serializer.toJson<String>(channelName),
      'description': serializer.toJson<String>(description),
      'localFilePath': serializer.toJson<String>(localFilePath),
    };
  }

  DownloadedAudio copyWith(
          {String? id,
          String? name,
          String? url,
          String? image,
          int? numberOfListeners,
          String? channelName,
          String? description,
          String? localFilePath}) =>
      DownloadedAudio(
        id: id ?? this.id,
        name: name ?? this.name,
        url: url ?? this.url,
        image: image ?? this.image,
        numberOfListeners: numberOfListeners ?? this.numberOfListeners,
        channelName: channelName ?? this.channelName,
        description: description ?? this.description,
        localFilePath: localFilePath ?? this.localFilePath,
      );
  @override
  String toString() {
    return (StringBuffer('DownloadedAudio(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('url: $url, ')
          ..write('image: $image, ')
          ..write('numberOfListeners: $numberOfListeners, ')
          ..write('channelName: $channelName, ')
          ..write('description: $description, ')
          ..write('localFilePath: $localFilePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              url.hashCode,
              $mrjc(
                  image.hashCode,
                  $mrjc(
                      numberOfListeners.hashCode,
                      $mrjc(
                          channelName.hashCode,
                          $mrjc(description.hashCode,
                              localFilePath.hashCode))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DownloadedAudio &&
          other.id == this.id &&
          other.name == this.name &&
          other.url == this.url &&
          other.image == this.image &&
          other.numberOfListeners == this.numberOfListeners &&
          other.channelName == this.channelName &&
          other.description == this.description &&
          other.localFilePath == this.localFilePath);
}

class DownloadedAudiosCompanion extends UpdateCompanion<DownloadedAudio> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> url;
  final Value<String?> image;
  final Value<int?> numberOfListeners;
  final Value<String> channelName;
  final Value<String> description;
  final Value<String> localFilePath;
  const DownloadedAudiosCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.url = const Value.absent(),
    this.image = const Value.absent(),
    this.numberOfListeners = const Value.absent(),
    this.channelName = const Value.absent(),
    this.description = const Value.absent(),
    this.localFilePath = const Value.absent(),
  });
  DownloadedAudiosCompanion.insert({
    required String id,
    required String name,
    required String url,
    this.image = const Value.absent(),
    this.numberOfListeners = const Value.absent(),
    required String channelName,
    required String description,
    required String localFilePath,
  })  : id = Value(id),
        name = Value(name),
        url = Value(url),
        channelName = Value(channelName),
        description = Value(description),
        localFilePath = Value(localFilePath);
  static Insertable<DownloadedAudio> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? url,
    Expression<String?>? image,
    Expression<int?>? numberOfListeners,
    Expression<String>? channelName,
    Expression<String>? description,
    Expression<String>? localFilePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (url != null) 'url': url,
      if (image != null) 'image': image,
      if (numberOfListeners != null) 'number_of_listeners': numberOfListeners,
      if (channelName != null) 'channel_name': channelName,
      if (description != null) 'description': description,
      if (localFilePath != null) 'local_file_path': localFilePath,
    });
  }

  DownloadedAudiosCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? url,
      Value<String?>? image,
      Value<int?>? numberOfListeners,
      Value<String>? channelName,
      Value<String>? description,
      Value<String>? localFilePath}) {
    return DownloadedAudiosCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      image: image ?? this.image,
      numberOfListeners: numberOfListeners ?? this.numberOfListeners,
      channelName: channelName ?? this.channelName,
      description: description ?? this.description,
      localFilePath: localFilePath ?? this.localFilePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (image.present) {
      map['image'] = Variable<String?>(image.value);
    }
    if (numberOfListeners.present) {
      map['number_of_listeners'] = Variable<int?>(numberOfListeners.value);
    }
    if (channelName.present) {
      map['channel_name'] = Variable<String>(channelName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (localFilePath.present) {
      map['local_file_path'] = Variable<String>(localFilePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DownloadedAudiosCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('url: $url, ')
          ..write('image: $image, ')
          ..write('numberOfListeners: $numberOfListeners, ')
          ..write('channelName: $channelName, ')
          ..write('description: $description, ')
          ..write('localFilePath: $localFilePath')
          ..write(')'))
        .toString();
  }
}

class $DownloadedAudiosTable extends DownloadedAudios
    with TableInfo<$DownloadedAudiosTable, DownloadedAudio> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DownloadedAudiosTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  late final GeneratedColumn<String?> url = GeneratedColumn<String?>(
      'url', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _numberOfListenersMeta =
      const VerificationMeta('numberOfListeners');
  late final GeneratedColumn<int?> numberOfListeners = GeneratedColumn<int?>(
      'number_of_listeners', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _channelNameMeta =
      const VerificationMeta('channelName');
  late final GeneratedColumn<String?> channelName = GeneratedColumn<String?>(
      'channel_name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _localFilePathMeta =
      const VerificationMeta('localFilePath');
  late final GeneratedColumn<String?> localFilePath = GeneratedColumn<String?>(
      'local_file_path', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        url,
        image,
        numberOfListeners,
        channelName,
        description,
        localFilePath
      ];
  @override
  String get aliasedName => _alias ?? 'downloaded_audios';
  @override
  String get actualTableName => 'downloaded_audios';
  @override
  VerificationContext validateIntegrity(Insertable<DownloadedAudio> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('number_of_listeners')) {
      context.handle(
          _numberOfListenersMeta,
          numberOfListeners.isAcceptableOrUnknown(
              data['number_of_listeners']!, _numberOfListenersMeta));
    }
    if (data.containsKey('channel_name')) {
      context.handle(
          _channelNameMeta,
          channelName.isAcceptableOrUnknown(
              data['channel_name']!, _channelNameMeta));
    } else if (isInserting) {
      context.missing(_channelNameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('local_file_path')) {
      context.handle(
          _localFilePathMeta,
          localFilePath.isAcceptableOrUnknown(
              data['local_file_path']!, _localFilePathMeta));
    } else if (isInserting) {
      context.missing(_localFilePathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  DownloadedAudio map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DownloadedAudio.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DownloadedAudiosTable createAlias(String alias) {
    return $DownloadedAudiosTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $DownloadedAudiosTable downloadedAudios =
      $DownloadedAudiosTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [downloadedAudios];
}

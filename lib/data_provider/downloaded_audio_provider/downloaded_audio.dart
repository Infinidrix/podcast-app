
// These imports are only needed to open the database
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'dart:io';

part 'downloaded_audio.g.dart';

class DownloadedAudios extends Table{
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get url => text()();
  TextColumn get image => text().nullable()();
  IntColumn get numberOfListeners => integer().nullable()();
  TextColumn get channelName => text()();
  TextColumn get description => text()();
  TextColumn get localFilePath => text()();
}

@UseMoor(tables: [DownloadedAudios])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. (Just reinstall the app)
  @override
  int get schemaVersion => 1;

  Future<List<DownloadedAudio>> get allDownloadedAudios => select(downloadedAudios).get();

  Future<DownloadedAudio?> checkIfPodcastDownloaded(String id) async {
    final query = select(downloadedAudios)
      ..where((audio) => audio.id.equals(id));
    return await query.getSingleOrNull();
  }
  Future<int> addDownloadedAudio(DownloadedAudiosCompanion downloadedAudio){
    return into(downloadedAudios).insert(downloadedAudio);
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}
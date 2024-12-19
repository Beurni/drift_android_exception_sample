
import 'package:drift/drift.dart';
import 'package:encrypted_drift/encrypted_drift.dart';

part 'database.g.dart';

@DriftDatabase(tables: [TestTable])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

class TestTable extends Table {
  IntColumn get id => integer()();

  TextColumn get data => text()();

  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {

    return EncryptedExecutor(path: 'database', password: 'password');
  });
}
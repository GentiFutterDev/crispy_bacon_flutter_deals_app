import 'package:drift/drift.dart';

class Deals extends Table {
  TextColumn get id => text()(); 
  TextColumn get title => text()();
  RealColumn get price => real()();
  TextColumn get thumbnail => text().nullable()();
  RealColumn get rating => real().nullable()();
  IntColumn get releaseDate => integer().nullable()();
  TextColumn get metacriticLink => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

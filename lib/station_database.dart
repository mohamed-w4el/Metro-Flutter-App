import 'package:metro_project/station.dart';
import 'package:metro_project/station_dao.dart';

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'station_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Station])
abstract class StationDatabase extends FloorDatabase {
  StationDao get stationDao;
}

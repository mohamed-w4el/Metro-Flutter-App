import 'dart:io';
import 'package:flutter/services.dart';
import 'package:metro_project/home_page.dart';
import 'package:metro_project/station_database.dart';
import 'package:metro_project/travel_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

Future<void> main() async {
  await initDatabase();
  runApp(const MyApp());
}

Future<void> initDatabase() async {
  await copyDatabase();

  //connect to Database
  final dir = await getApplicationDocumentsDirectory();
  final dbPath = join(dir.path, 'stations.db');

  final database = await $FloorStationDatabase.databaseBuilder(dbPath).build();
}

Future<void> copyDatabase() async {
  final dir = await getApplicationDocumentsDirectory();
  final path = join(dir.path, 'stations.db');
  print(path);

  if (File(path).existsSync()) return;

  ByteData data = await rootBundle.load('assets/databases/stations.db');
  List<int> bytes = data.buffer.asUint8List(
    data.offsetInBytes,
    data.lengthInBytes,
  );
  await File(path).writeAsBytes(bytes);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: TravelPage(),
    );
  }
}

import 'package:drift/drift.dart';
import 'package:time_boxing/DB/database.dart';
import 'package:flutter/material.dart';

class RepositoryForZandi extends ChangeNotifier {
  //field

  final Mydatabase _myDatabase;

  //Singleton
  static final RepositoryForZandi _repositoryForZandi = RepositoryForZandi._inner();

  RepositoryForZandi._inner() : _myDatabase = Mydatabase();

  factory RepositoryForZandi() {
    return _repositoryForZandi;
  }

  // insert ZandiInfo FirstTime
  Future<int> insertZandiInfo_FirstTime(DateTime date) {
    return _myDatabase.into(_myDatabase.zandiInfo).insert(ZandiInfoCompanion.insert(date: date, stack: 0));
  }

  // update ZandiInfo
  Future<int> updateZandiInfo(DateTime date, int stack) {
    return (_myDatabase.update(_myDatabase.zandiInfo)..where((t) => t.date.equals(date))).write(ZandiInfoCompanion(date: Value(date), stack: Value(stack)));
  }

  //select ZandiInfo recent data
  Future<List<ZandiInfoData>> selectRecentData() {
    final result = (_myDatabase.select(_myDatabase.zandiInfo)..orderBy([(t) => OrderingTerm.desc(t.date)])..limit(1)).get();
    return result;
  }

  // select ZandiInfo get all
  Future<List<ZandiInfoData>> selectZandiAll() {
    final result = (_myDatabase.select(_myDatabase.zandiInfo)).get();
    return result;
  }

  //select ZandiInfo 35days ago
  //date값 넘겨줄때 flutter:math 사용하여 35일전 날짜로 변경하여 줄것
  Future<List<ZandiInfoData>> selectZandi35DaysAgo(DateTime date) {
    final result = (_myDatabase.select(_myDatabase.zandiInfo)..where((t) => t.date.isBiggerOrEqualValue(date))).get();
    return result;
  }

  //select ZandiInfo max stack
  Future<List<ZandiInfoData>> selectZandi35MaxStack() {
    final result = (_myDatabase.select(_myDatabase.zandiInfo)..orderBy([(t) => OrderingTerm.desc(t.stack)])..limit(1)).get();
    return result;
  }

}
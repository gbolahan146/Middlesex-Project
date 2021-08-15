import 'dart:io';

import 'package:asthma_management/core/models/diary.dart';
import 'package:asthma_management/core/models/diary_log_model.dart';
import 'package:asthma_management/core/models/emergency_contact.dart';
import 'package:asthma_management/core/models/medication.dart';
import 'package:asthma_management/core/models/peak.dart';
import 'package:asthma_management/core/models/reminder.dart';
import 'package:asthma_management/core/models/rescue.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:asthma_management/core/models/userModel.dart';
import 'package:path_provider/path_provider.dart';

class DB {
  static final DB _dbHelper = DB._internal();
  DB._internal();

  factory DB() {
    return _dbHelper;
  }

  static Database _db;

  String tblUsers = "users";
  String gender = "gender";
  String height = "height";
  String peakflow = "peakflow";
  String birthdate = "birthdate";
  String country = "country";
  String ageDiagnosed = "ageDiagnosed";
  String triggers = "triggers";
  String contacts = "contacts";
  String symptoms = "symptoms";
  String age = "age";
  String username = "username";
  String fullname = "fullname";
  String image = "image";
  String userID = "id";

  String tblDiary = "diary";
  String colPid = "id";
  String dayQuestion = "dayQuestion";
  String triggerQuestion = "triggerQuestion";
  String symptomsQuestion = "symptomsQuestion";
  String dateHappened = "dateHappened";
  String time = "time";
  String moreText = "moreText";

  String tblEmergencyContacts = "emergencyContacts";
  String emergencyName = "emergencyName";
  String emergencyRelation = "emergencyRelation";
  String emergencyNumber = "emergencyNumber";

  String tblPeak = "peak";
  String peakId = 'id';
  String day = "day";
  String value = "value";

  String tblMedication = "medicationTable";
  String medication = "medication";
  String medID = "id";

  String tblRescue = "rescueTable";
  String rescue = "rescue";
  String resId = "id";

  String tblRem = "reminderTable";
  String remId = "remId";
  String timeRem = "timeRem";
  String repeat = "repeat";
  String notes = "notes";
  String takeMeds = "takeMeds";

  String tblDiaryLogs = "diaryLogs";
  String logTitle = "title";
  String logTime = "logTime";
  String logDate = "logDate";
  String logTriggers = "logTriggers";
  String logDescription = "description";
  String logSymptoms = "logSymptoms";

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    Directory dir = await getExternalStorageDirectory();
    String path = dir.path + "asthma.db";
    print(dir);
    print(path);
    var dbUser = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
    return dbUser;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''
      CREATE TABLE $tblUsers(
      $userID INTEGER PRIMARY KEY,
      $gender TEXT, 
      $peakflow TEXT, 
      $height TEXT, 
      $birthdate TEXT,
      $image TEXT,
      $fullname TEXT,
      $username TEXT,
      $country TEXT, 
      $ageDiagnosed TEXT,
      $triggers TEXT,
      $contacts TEXT,
      $symptoms TEXT,
      $age TEXT
      )
      ''');
    await db.execute('''
      CREATE TABLE $tblDiary(
      $colPid INTEGER PRIMARY KEY,
      $dayQuestion TEXT, 
      $triggerQuestion TEXT,
      $symptomsQuestion TEXT,
      $dateHappened TEXT,
      $time TEXT,
      $moreText TEXT
    )
      ''');
    await db.execute('''
      CREATE TABLE $tblEmergencyContacts(
      $emergencyName TEXT PRIMARY KEY, 
      $emergencyNumber TEXT,
      $emergencyRelation TEXT
    )
      ''');
    await db.execute('''
      CREATE TABLE $tblPeak(
      $peakId INTEGER PRIMARY KEY,
      $day TEXT, 
      $value INTEGER
      
    )
      ''');
    await db.execute('''
      CREATE TABLE $tblMedication(
      $medication TEXT
      $medID INTEGER PRIMARY KEY
    )
      ''');
    await db.execute('''
      CREATE TABLE $tblRescue(
      $rescue TEXT
      $resId INTEGER PRIMARY KEY   
    )
      ''');
    await db.execute('''
      CREATE TABLE $tblRem(
      $remId INTEGER PRIMARY KEY,
      $takeMeds TEXT, 
      $notes TEXT,
      $repeat TEXT,
      $timeRem TEXT
    )
      ''');
    await db.execute('''
      CREATE TABLE $tblDiaryLogs(
      $logTitle TEXT PRIMARY KEY,
      $logDate TEXT, 
      $logTime TEXT,
      $logDescription TEXT,
      $logSymptoms TEXT,
      $logTriggers TEXT
    )
      ''');
  }

  Future<int> insertUser(User user) async {
    Database db = await this.db;
    var result = await db.insert(tblUsers, user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<List> getUser() async {
    Database db = await this.db;
    var result =
        await db.rawQuery("SELECT * FROM $tblUsers"); // order by $colId ASC
    return result;
  }

  Future<int> insertDiary(Diary diary) async {
    Database db = await this.db;
    var result = await db.insert(tblDiary, diary.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<int> insertEmergencyContacts(
      EmergencyContactsModel emergencyContactsModel) async {
    Database db = await this.db;
    var result = await db.insert(
        tblEmergencyContacts, emergencyContactsModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<int> deleteEmergencyContacts(String emergencyNamee) async {
    Database db = await this.db;

    var result = await db.delete(tblEmergencyContacts,
        where: 'emergencyName = ?', whereArgs: [emergencyNamee]);

    return result;
  }

  Future<List> getEmergencyContacts() async {
    Database db = await this.db;
    var result = await db.rawQuery(
        "SELECT * FROM $tblEmergencyContacts order by $emergencyName DESC"); // order by $colId ASC
    return result;
  }

  Future<List> getDiary() async {
    Database db = await this.db;
    var result = await db.rawQuery(
        "SELECT * FROM $tblDiary order by $colPid DESC"); // order by $colId ASC
    return result;
  }

  Future<int> insertReminder(Reminder reminder) async {
    Database db = await this.db;
    var result = await db.insert(tblRem, reminder.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<List> getReminders() async {
    Database db = await this.db;
    var result =
        await db.rawQuery("SELECT * FROM $tblRem"); // order by $colId ASC
    return result;
  }

  Future<int> deleteReminders(String reminderTitle) async {
    Database db = await this.db;

    var result = await db
        .delete(tblRem, where: 'takeMeds = ?', whereArgs: [reminderTitle]);

    return result;
  }

  Future<int> insertPeak(Peak peak) async {
    Database db = await this.db;
    var result = await db.insert(tblPeak, peak.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<List> getPeak() async {
    Database db = await this.db;
    var result = await db.rawQuery(
        "SELECT * FROM $tblPeak order by $peakId DESC"); // order by $colId ASC
    return result;
  }

  Future<int> insertMedication(Medication medication) async {
    Database db = await this.db;
    var result = await db.insert(tblMedication, medication.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<List> getMedication() async {
    Database db = await this.db;
    var result = await db
        .rawQuery("SELECT * FROM $tblMedication"); // order by $colId ASC
    return result;
  }

  Future<int> deleteMedication(String medication) async {
    Database db = await this.db;

    var result = await db.delete(tblMedication,
        where: 'medication = ?', whereArgs: [medication]);

    return result;
  }

  Future<int> insertRescue(Rescue rescue) async {
    Database db = await this.db;
    var result = await db.insert(tblRescue, rescue.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<int> deleteRescue(String rescue) async {
    Database db = await this.db;

    var result =
        await db.delete(tblRescue, where: 'rescue = ?', whereArgs: [rescue]);

    return result;
  }

  Future<int> insertDiaryLog(DiaryLog diaryLog) async {
    Database db = await this.db;
    var result = await db.insert(tblDiaryLogs, diaryLog.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<List> getDiaryLog() async {
    Database db = await this.db;
    var result =
        await db.rawQuery("SELECT * FROM $tblDiaryLogs"); // order by $colId ASC
    return result;
  }

  Future<int> deleteDiarylog(String logtitle) async {
    Database db = await this.db;
    var result = await db
        .delete(tblDiaryLogs, where: 'title = ?', whereArgs: [logtitle]);
    return result;
  }

  Future<List> getRescue() async {
    Database db = await this.db;
    var result =
        await db.rawQuery("SELECT * FROM $tblRescue"); // order by $colId ASC
    return result;
  }

  Future<int> updateUser(User user) async {
    var db = await this.db;
    var result = await db.update(tblUsers, user.toJson(),
        where: "$userID = ?", whereArgs: [user.id]);

    return result;
  }

  Future<int> updateDiary(Diary diary) async {
    var db = await this.db;
    var result = await db.update(tblDiary, diary.toJson(),
        where: "$colPid = ?", whereArgs: [diary.id]);
    return result;
  }
}

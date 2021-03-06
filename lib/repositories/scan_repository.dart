
import 'package:sqflite/sqflite.dart';

import 'package:qr_app/providers/db_provider.dart';

import 'package:qr_app/models/scan.dart';

class ScanRepository{

  Future<List<Scan>> getAll() async{
    final Database db = await DbProvider.db.database;

    final res = await db.query('scans');

    return res.map((e) => Scan.fromMap(e)).toList();
  }

    Future<List<Scan>> getByType(String type) async {
    final Database db = await DbProvider.db.database;
    
    final res  = await db.query('scans',where: 'type = ?', whereArgs: [ type ]);
    
    return res.map((e) => Scan.fromMap(e)).toList();
  }

  Future<Scan?>? getById(int id) async {
    final Database db = await DbProvider.db.database;
    
    final res  = await db.query('scans',where: 'id = ?', whereArgs: [ id ]);

    return res.isNotEmpty?
        Scan.fromMap(res.first)
        :
        null;
  }

  Future<int> create(Scan newScan) async{

    final Database db = await DbProvider.db.database;

    final res = await db.insert('scans', newScan.toMap());

    return res;
  }

  update(Scan scan) async{
    final Database db = await DbProvider.db.database;

    final res = await db.update('scans', scan.toMap(), where: 'id = ?', whereArgs: [ scan.id ] );

    return res;

  }

  deleteById(int id) async{
     final Database db = await DbProvider.db.database;

     final res = db.delete('scans', where: 'id = ?', whereArgs: [ id ]);

     return res;
  }

  deleteAll() async{
    final Database db = await DbProvider.db.database;

    final res = db.rawQuery(
      '''
        DELETE FROM scans
      ''');
    return res;
  }

  

  

}
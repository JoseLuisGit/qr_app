import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider{

  static Database? _database;

  static final DbProvider db = DbProvider._();

  DbProvider._();

   get database async{

    if(_database != null) return _database;

    return await initDb();
  }

  Future<Database> initDb() async{

    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'scansDB.db');

    print(path);
    
    return await openDatabase(
      path, 
      version: 1,
      onOpen: (db){},
      onCreate: (Database db, int version) async{
        await db.execute(
          '''
            CREATE TABLE scans(
              id INTEGER PRIMARY KEY,
              type TEXT,
              value TEXT
            )

          '''
        );
      }
    ); 

  }


}
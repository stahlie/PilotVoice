
import 'dart:async';
//import 'package:async/async.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'AirportModel.dart';

class DBProvider {
  static final DBProvider _instance = new DBProvider.internal();
 // final AsyncMemoizer _memoizer = AsyncMemoizer();
  factory DBProvider() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null)  return _db;
    _db = await initDB();
    return _db;
  }

  DBProvider.internal();

  Future<Database> initDB() async {

    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "assets/pilotvoice.db");

    var theDb = await openDatabase(path, version: 1); //, onCreate: _onCreate);
    return theDb;


  }

   /*void _onCreate(Database db, int version) async {
      await db.execute("CREATE TABLE airportTable ("
              "faaID TEXT UNIQUE PRIMARY KEY,"
              "airportName TEXT"
              ")");

  } */

  Future<int> saveAirportInfo(AirportModel airport) async {
    var dbAirport = await db;
    int res = await dbAirport.insert("airportTable", airport.toMap());
    return res;
  }

  Future<List<AirportModel>> getAllAirports() async {
   //   print("*****Entering getAllAirports*********");
   //return this._memoizer.runOnce(()   async {
        print("=========== Entered getAllAirports========");
        var dbAirport = await db;
        String sql;
        sql = "SELECT * FROM airportTable";

        var result = await dbAirport.rawQuery(sql);

        if (result.length == 0) return null;

        List<AirportModel> list = result.map((item) {
         return AirportModel.fromMap(item);
        }).toList();

        return list;

     // });
  }
}
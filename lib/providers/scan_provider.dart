import 'package:flutter/material.dart';

import 'package:qr_app/models/scan.dart';
import 'package:qr_app/repositories/scan_repository.dart';

class ScanProvider extends ChangeNotifier{

  List<Scan> scans = [];
  String currentType = 'http';
  ScanRepository scanRepository = ScanRepository();

  createScan(String value) async{

    Scan newScan = Scan(value: value);

    final id = await scanRepository.create(newScan);

    newScan.id = id;

    if(newScan.type == currentType){
      scans.add(newScan);
      notifyListeners();
    }

  }

  getAllScans() async{
    scans = await scanRepository.getAll();
    notifyListeners();
  }

  getAllByType(String type) async{
    scans = await scanRepository.getByType(type);

    currentType = type;
    notifyListeners();
  }

  deleteAllScan() async{
    await scanRepository.deleteAll();
    scans = [];
    notifyListeners();
  }

  deleteById(int id) async{
    scans.removeWhere((scan) => scan.id == id);
    await scanRepository.deleteById(id);
  }


}
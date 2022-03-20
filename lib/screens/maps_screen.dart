import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_app/models/scan.dart';
import 'package:qr_app/providers/scan_provider.dart';

class MapsScreen extends StatelessWidget {
   
  const MapsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final scanProvider = Provider.of<ScanProvider>(context);
    
    final scans = scanProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, index){
        final scan = scans[index];
        return ListTile(
          title: Text(scan.value),
          subtitle: Text('id: ${scan.id}'),
          trailing: const Icon(Icons.arrow_drop_down),
        );
    });
  }
}
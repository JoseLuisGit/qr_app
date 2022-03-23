import 'package:flutter/material.dart';

import 'package:qr_app/models/scan.dart';

class MapScreen extends StatelessWidget {
   
  const MapScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final Scan scan = ModalRoute.of(context)!.settings.arguments as Scan;

    return Scaffold(
      body: Center(
         child: Text(scan.value),
      ),
    );
  }
}
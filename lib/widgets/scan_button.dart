import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/models/scan.dart';

import 'package:qr_app/providers/scan_provider.dart';
import 'package:qr_app/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancelar', false, ScanMode.QR);

        final scanProvider = Provider.of<ScanProvider>(context, listen: false);

        if(barcodeScanRes != '-1'){
          Scan newScan = await scanProvider.createScan(barcodeScanRes);

          launchUrl(context, newScan);
        }

      },
      child: const Icon(Icons.qr_code_2),
    );
  }
}

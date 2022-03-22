import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_app/providers/scan_provider.dart';

class ScanList extends StatelessWidget {

  final String type;
  const ScanList({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<ScanProvider>(context);

    final scans = scanProvider.scans;

    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, index) {
          final scan = scans[index];
          return Dismissible(
            key: Key(scan.id.toString()),
            background: Container(
              color: Colors.redAccent,
            ),
            onDismissed: (DismissDirection dismissDirection) async {
              await Provider.of<ScanProvider>(context, listen: false)
                  .deleteById(scan.id!);
            },
            child: ListTile(
              leading: Icon(type == 'http' ? Icons.directions : Icons.map_outlined),
              title: Text(scan.value),
              subtitle: Text('id: ${scan.id}'),
              trailing: const Icon(Icons.arrow_drop_down),
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/models/scan.dart';

import 'package:qr_app/providers/db_provider.dart';
import 'package:qr_app/providers/ui_provider.dart';

import 'package:qr_app/repositories/scan_repository.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.currentIndexScreen;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){
        uiProvider.setCurrentIndexScreen = index;
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.directions), label: 'Direcciones'),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
      ],
    );
  }
}
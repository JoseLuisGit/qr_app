import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_app/providers/scan_provider.dart';
import 'package:qr_app/providers/ui_provider.dart';

import 'package:qr_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:qr_app/widgets/scan_button.dart';

import 'screens.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<ScanProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Historial'),
        actions: [
          IconButton(onPressed: (){

            scanProvider.deleteAllScan();

          }, icon: Icon(Icons.delete))
        ],
      ),
      body: _HomeBodyScreen(),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeBodyScreen extends StatelessWidget {
  const _HomeBodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    final scanProvider = Provider.of<ScanProvider>(context, listen: false);

    final currentIndex = uiProvider.currentIndexScreen;

    switch (currentIndex) {
      case 0:
        scanProvider.getAllByType('http');
        return DirectionsScreen();
      case 1:
        scanProvider.getAllByType('geo');
        return MapsScreen();
      default:
      return  DirectionsScreen();
    }
  }
}
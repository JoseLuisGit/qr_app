import 'package:flutter/material.dart';

import 'package:qr_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:qr_app/widgets/scan_button.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Historial'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.delete))
        ],
      ),
      body: Center(
         child: Text('HomeScreen'),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
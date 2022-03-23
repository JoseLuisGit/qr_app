import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


import 'package:qr_app/models/scan.dart';

launchUrl(BuildContext context, Scan scan) async{

  if(scan.type == 'http'){

    final url = scan.value;

  if (!await launch(url)) throw 'Could not launch $url';

  }else{
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}
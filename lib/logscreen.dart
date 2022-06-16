// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../main.dart';


class LogsScreen extends StatelessWidget {
  List<String> logs;
  LogsScreen({Key? key,
    required this.logs
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xFF48CEED),
    title: const Align(
    alignment: AlignmentDirectional(-1, 0),
    child: Text(
    'Water Tracker',
    style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    ),
    ),
    )),

    backgroundColor: Color(0xFFEDFEFF),
    body: ListView.builder(
        itemCount: logs.length,
        padding: EdgeInsetsDirectional.fromSTEB(0,0,8,0),
        itemBuilder: (BuildContext context,int index){
      return ListTile(
        dense: true,
        title: (logs[index].contains('Deleted'))?Text(logs[index],style: TextStyle(fontSize:20,color: Color(0xFFb22222),fontWeight: FontWeight.w500 ),):Text(logs[index],style: TextStyle(fontSize:20,color: Color(0xFF252525),fontWeight: FontWeight.w500 ),),
      );
    })
    );
  }
  
  }




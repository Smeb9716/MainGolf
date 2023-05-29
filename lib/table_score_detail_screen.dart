import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TableScoreDetailScreen extends StatefulWidget{
  const TableScoreDetailScreen({super.key});

  @override
  State<TableScoreDetailScreen> createState() => _TableScoreDetailScreenState();
  
}

class _TableScoreDetailScreenState extends State<TableScoreDetailScreen> {

  @override
  void initState() {
    super.initState();
    // Show Horizontal screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    // Show Normal screen and hide Horizontal screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20.0),
      child: Table(
        border: TableBorder.all(color: Colors.black),
        children: [
          TableRow(children: [
            Text('Cell 1'),
            Text('Cell 2'),
            Text('Cell 3'),
          ]),
          TableRow(children: [
            Text('Cell 4'),
            Text('Cell 5'),
            Text('Cell 6'),
          ])
        ],
      ),
    );
  }
}
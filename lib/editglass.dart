import 'package:flutter/material.dart';
import '../main.dart';

class EditGlassScreen extends StatefulWidget {
  const EditGlassScreen({Key? key}) : super(key: key);

  @override
  State<EditGlassScreen> createState() => _EditGlassScreenState();
}
class _EditGlassScreenState extends State<EditGlassScreen>{
  int _glass=250;
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
    body: Column(mainAxisSize: MainAxisSize.max, children:  <Widget>[
    Padding(
    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: (newval){
          setState(() {
            _glass=int.parse(newval);
          });
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter new Glass Size in ml',

        ),
      ),

    ),Padding(
    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
       child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Color(0xFFFF5963),
            minimumSize: Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )
        ),
        onPressed: (){Navigator.pop(context,_glass);},
        child: Text(
          'Save',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFFFFF),
          ),

        ),
      )
      )]
    )
    );
  }
  
  }




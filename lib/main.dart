import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testapp/editbottle.dart';
import 'package:testapp/editglass.dart';
import 'package:testapp/logscreen.dart';
import 'package:intl/intl.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _total= 0;
  int _glasscounter = 0;
  int _bottlecounter = 0;
  int _glasssize=250;
  int _bottlesize=750;
  final logs=<String>[];

  void _reset() {
    setState(() {
      _glasscounter=0;
      _total=0;
      _bottlecounter = 0;
      logs.clear();
    });
  }



  void _addglass() {
    setState(() {
      _glasscounter+=1;
      _total=_total+(_glasssize/1000);
      DateTime now=DateTime.now();
      String format=DateFormat('hh:mm a').format(now);
      logs.add('Drank a $_glasssize ml glass at $format');

    });
  }
  void _subtractglass() {
    setState(() {
      if (_glasscounter != 0){
        _glasscounter-=1;
        _total=_total-(_glasssize/1000);
        DateTime now=DateTime.now();
        String format=DateFormat('hh:mm a').format(now);
        logs.add('Deleted a $_glasssize ml glass at $format');
      }
    });
  }
  void _addbottle() {
    setState(() {
      _bottlecounter+=1;
      _total=_total+(_bottlesize/1000);
      DateTime now=DateTime.now();
      String format=DateFormat('hh:mm a').format(now);
      logs.add('Finished a $_bottlesize ml bottle at $format');
    });
  }
  void _subtractbottle() {
    setState(() {

      if(_bottlecounter != 0){
        _bottlecounter-=1;
        _total=_total-(_bottlesize/1000);
        DateTime now=DateTime.now();
        String format=DateFormat('hh:mm a').format(now);
        logs.add('Deleted a $_bottlesize ml bottle at $format');
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFF48CEED),
            title: const Align(
              alignment: AlignmentDirectional(0, 0),
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
          Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                child: Container(
                  width: double.infinity,
                  height: 175,
                  decoration: BoxDecoration(
                    color: Color(0xFFBCDFEB),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                      Row(
                      mainAxisSize: MainAxisSize.max,
                      children: const <Widget>[
                          Text(
                          'Total Water Drank',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF252525),
                          ),
                        ),
                      ],
                    ),
                        Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children:  <Widget>[
                            Expanded(
                            child: Text(
                              '$_total/2L',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF252525),
                              ),
                            ),
                            ),
                          ],
                        ),
                        ),

                        

                ]
                    ),
              ),
                ),
        ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: Container(
                width: double.infinity,
                height: 175,
                decoration: BoxDecoration(
                  color: Color(0xFFBCDFEB),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children:  <Widget>[
                            Text(
                              'Total Glasses Drank',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF252525),
                              ),
                            ),
                            IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.glassWater), iconSize: 25,)
                          ],
                        ),
                        Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children:  <Widget>[
                            IconButton(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                onPressed: _subtractglass,
                                tooltip: 'Decrease glass count',
                                icon: Icon(
                                  Icons.remove,
                                  size: 50,
                                  color: Color(0xFFb22222),
                                )
                            ),
                            Expanded(
                            child: Text(
                              '$_glasscounter',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF252525),
                              ),
                            ),
                            ),
                            IconButton(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                onPressed: _addglass,
                                tooltip: 'Increase glass count',
                                icon: Icon(
                                  Icons.add,
                                  size: 50,
                                  color: Color(0xFF32CD32),
                                )
                            ),
                          ],
                        ),
                        ),

                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children:  <Widget>[
                            Text(
                              'Current Glass Size is $_glasssize ml',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF5963),
                              ),
                            ),
                            IconButton(onPressed: () async{
                              final gval=await Navigator.push(context, MaterialPageRoute(builder: (context)=> EditGlassScreen()));
                              setState(() {
                                _glasssize=gval;
                              });
                            }, icon: const FaIcon(FontAwesomeIcons.penToSquare),iconSize: 20,tooltip: 'Edit glass size',)
                          ],
                        ),



                      ]
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: Container(
                width: double.infinity,
                height: 175,
                decoration: BoxDecoration(
                  color: Color(0xFFBCDFEB),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children:  <Widget>[
                            Text(
                              'Total Bottles Drank',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF252525),
                              ),
                            ),
                            IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.bottleWater), iconSize: 25,)
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children:  <Widget>[
                              IconButton(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                  onPressed: _subtractbottle,
                                  tooltip: 'Decrease bottle count',
                                  icon: Icon(
                                    Icons.remove,
                                    size: 50,
                                    color: Color(0xFFb22222),
                                  )
                              ),
                              Expanded(
                                child: Text(
                                  '$_bottlecounter',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF252525),
                                  ),
                                ),
                              ),
                              IconButton(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                  onPressed: _addbottle,
                                  tooltip: 'Increase bottle count',
                                  icon: Icon(
                                    Icons.add,
                                    size: 50,
                                    color: Color(0xFF32CD32),
                                  )
                              ),
                            ],
                          ),
                        ),

                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children:  <Widget>[
                            Text(
                              'Current Bottle Size is $_bottlesize ml',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF5963),
                              ),
                            ),
                            IconButton(onPressed: () async{
                              final bval=await Navigator.push(context, MaterialPageRoute(builder: (context)=> EditBottleScreen()));
                              setState(() {
                                _bottlesize=bval;
                              });
                            }, icon: const FaIcon(FontAwesomeIcons.penToSquare),iconSize: 20,tooltip: 'Edit bottle size',)
                          ],
                        ),
                      ]
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                      Row(
                      mainAxisSize: MainAxisSize.max,
                      children:  <Widget>[
                         TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xFFFF5963),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )
                          ),
                            onPressed: _reset,
                            child: Text(
                                '      Reset      ',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFFFFFF),
                              ),

                            ),
                        ),
                        Padding(padding: EdgeInsetsDirectional.fromSTEB(6.65, 0, 0, 0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xFF4B39EF),
                              // minimumSize: Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> LogsScreen(logs: logs)));
                          },
                          child: Text(
                            '    Activity   ',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFFFFF),
                            ),

                          ),
                        )
                        )])]
                  ),
                ),
              ),

        ]));
  }
}

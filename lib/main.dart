import 'package:flutter/material.dart';
import 'mqtt_client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AGV_Control',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'AGV Control'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
              onPressed: () {
                mqttpublish('agv/go');
              },
              child: Text(
                '上',
                style: TextStyle(fontSize: 20),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                  onPressed: () {
                    mqttpublish('agv/left');
                  },
                  child: Text(
                    '左',
                    style: TextStyle(fontSize: 20),
                  )),
              FloatingActionButton(
                  onPressed: () {
                    mqttpublish('agv/stop');
                  },
                  child: Text(
                    'Stop',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
              FloatingActionButton(
                onPressed: () {
                  mqttpublish('agv/right');
                },
                child: Text(
                  '右',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          FloatingActionButton(
              onPressed: () {
                mqttpublish('agv/back');
              },
              child: Text(
                '下',
                style: TextStyle(fontSize: 20),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                  onPressed: () {
                    mqttconnect();
                  },
                  child: Text(
                    'C',
                    style: TextStyle(fontSize: 20),
                  )),
              FloatingActionButton(
                  onPressed: () {
                    client.disconnect();
                  },
                  child: Text(
                    'E',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

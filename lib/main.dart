import 'dart:async';
import 'package:flutter/material.dart';
import 'parsejson.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
var xx;
final String ccc = "";
void main() async {
  runApp (new MyApp()  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'QRCode Reader Demo',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  final Map<String, dynamic> pluginParameters = {};

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<String> _barcodeString;
  Future<String> _get_url;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('QRCode Reader Example'),
      ),
      body: new Center(
          child: new FutureBuilder<String>(
              future: _barcodeString,

              builder: ( BuildContext context, AsyncSnapshot<String> snapshot )   {
                if (snapshot.data != null) {
                 //String ccc  = get_url(snapshot.data).toString ()   ;
                  get_url(snapshot.data).then((ccc) async {
                   xx =ccc;
                  });
                  String $xx =ccc;
                  return new Text ($xx);

                } else {
                  return new Text("Error");
                }
              })),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          setState(() {
            _barcodeString = new QRCodeReader()
                .setAutoFocusIntervalInMs(200)
                .setForceAutoFocus(true)
                .setTorchEnabled(true)
                .setHandlePermissions(true)
                .setExecuteAfterPermissionGranted(true)
                .scan();
          });
        },
        tooltip: 'Reader the QRCode',
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }
}

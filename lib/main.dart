import 'package:flutter/material.dart';
import 'package:hello_world/dropdown.dart';
import 'input.dart';
import 'result.dart';
import 'convert.dart';
import 'riwayat.dart';
import 'dropdown.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
// This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etCelcius = new TextEditingController();

  double nCelcius = 0;
  String _newValue = "Kelvin";
  double _result = 0;
  List<String> listViewItem = [];

  void _konversiSuhu() {
    setState(() {
      nCelcius = double.parse(etCelcius.text);
      if (_newValue == "Kelvin")
        _result = nCelcius + 273;
      else if (_newValue == "Reamur")
        _result = (4 / 5) * nCelcius;
      else
        _result = (nCelcius * 9 / 5) + 32;
      listViewItem.add("$_newValue : $_result");
    });
  }

  void dropdownOnChanged(String changeValue) {
    setState(() {
      _newValue = changeValue;
    });
    _konversiSuhu();
  }

  var listString = [
    "Kelvin",
    "Reamur",
    "Fahrenheit",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Input(etCelcius: etCelcius),
              Dropdown(
                listView: listString,
                newValue: _newValue,
                newMethod: dropdownOnChanged,
              ),
              Result(
                result: _result,
              ),
              Convert(konvertHandler: _konversiSuhu),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: RiwayatKonversi(listViewItem: listViewItem),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String operaciones = "";
  String total = "";
  String concatenaTotal = "";
  int bandera = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
      ),
      body: body(),
    );
  }

  Widget body() {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
            height: 100,
            child: Row(
              children: [Text(concatenaTotal)],
            ),
          ),
        ),
        Container(
          color: Colors.blue,
          height: 100,
          child: Row(
            children: [Text(operaciones)],
          ),
        ),
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "7";
                        });
                      },
                      child: Text("7")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "8";
                        });
                      },
                      child: Text("8")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "9";
                        });
                      },
                      child: Text("9")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += " / ";
                        });
                      },
                      child: Text("/")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "4";
                        });
                      },
                      child: Text("4")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "5";
                        });
                      },
                      child: Text("5")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "6";
                        });
                      },
                      child: Text("6")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += " * ";
                        });
                      },
                      child: Text("*")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "1";
                        });
                      },
                      child: Text("1")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "2";
                        });
                      },
                      child: Text("2")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "3";
                        });
                      },
                      child: Text("3")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += " - ";
                        });
                      },
                      child: Text("-")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "0";
                        });
                      },
                      child: Text("0")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones = "";
                        });
                      },
                      child: Text("C")),
                  ElevatedButton(
                      onPressed: calculadorOperador, child: Text("=")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += " + ";
                        });
                      },
                      child: Text(" + ")),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  void calculadorOperador() {
    var lista = operaciones.split(" ");
    if (lista.length > 1) {
      bandera = 0;
    }

    if (lista.length == 1) {
      var resultado = int.parse(lista[0]);
      setState(() {
        bandera++;
        total = "$resultado";
      });
    }
    if (lista.length > 1) {
      if (lista[1].trim() == '-') {
        var resultado = int.parse(lista[0]) - int.parse(lista[2]);
        setState(() {
          total = "$resultado";
        });
      }

      if (lista[1].trim() == '+') {
        var resultado = int.parse(lista[0]) + int.parse(lista[2]);
        setState(() {
          total = "$resultado";
        });
      }

      if (lista[1].trim() == '*') {
        var resultado = int.parse(lista[0]) * int.parse(lista[2]);
        setState(() {
          total = "$resultado";
        });
      }

      if (lista[1].trim() == '/') {
        var resultado = int.parse(lista[0]) / int.parse(lista[2]);
        setState(() {
          total = "$resultado";
        });
      }
    }

    if (bandera == 1) {
      concatenaTotal += lista[0] + '\n';
    }
    if (bandera == 0) {
      concatenaTotal += lista[0] + lista[1] + lista[2] + " = " + total + '\n';
    }
    operaciones = total;
  }
}

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String operaciones = "";
  String total = "";
  List<Text> concatenaTotal = [];
  //String concatenaTotal = "";
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: concatenaTotal,
                  ),
                ],
              ),
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
          color: Colors.yellow,
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
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += "√ ";
                        });
                      },
                      child: Text("√")),
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
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += " ² ";
                        });
                      },
                      child: Text("x²")),
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
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += " % ";
                        });
                      },
                      child: Text("%")),
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
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operaciones += " < ";
                        });
                      },
                      child: Text("<")),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  bool expresionesMalformadas() {
    var lista = operaciones.split(" ");
    Pattern pattern = "[0-9]";
    RegExp regex = new RegExp(pattern);

    if (lista[0].trim() == '√') {
      if (lista.length == 2) {
        if (!regex.hasMatch(lista[0]) && regex.hasMatch(lista[1])) {
          return true;
        }
        return false;
      }
      return false;
    }

    if (lista[1].trim() == '²') {
      return true;
    }

    if (lista.length == 1) {
      if (!regex.hasMatch(lista[0])) {
        return false;
      }
    }

    if (lista.length > 1) {
      if (((!regex.hasMatch(lista[0])) && (!regex.hasMatch(lista[1]))) ||
          ((regex.hasMatch(lista[0])) &&
              (!regex.hasMatch(lista[1])) &&
              (!regex.hasMatch(lista[2]))) ||
          ((!regex.hasMatch(lista[0])) &&
              (!regex.hasMatch(lista[1])) &&
              (!regex.hasMatch(lista[2]))) ||
          ((!regex.hasMatch(lista[0])) && (regex.hasMatch(lista[1])))) {
        return false;
      }
    }
    return true;
  }

  void calculadorOperador() {
    var lista = operaciones.split(" ");
    int resultado = 0;

    print(lista.length);

    if (!expresionesMalformadas()) {
      var expresionesMalforma = "Expresiones Malformadas";
      setState(() {
        total = "$expresionesMalforma";
      });
    }

    if (expresionesMalformadas()) {
      if (lista.length > 1) {
        bandera = 0;
      }

      if (lista.length == 1) {
        resultado = int.parse(lista[0]);
        setState(() {
          bandera++;
          total = "$resultado";
        });
      }

      if (lista.length > 1) {
        if (lista[1].trim() == '-') {
          resultado = int.parse(lista[0]) - int.parse(lista[2]);
          setState(() {
            total = "$resultado";
          });
        }

        if (lista[1].trim() == '+') {
          resultado = int.parse(lista[0]) + int.parse(lista[2]);
          setState(() {
            total = "$resultado";
          });
        }

        if (lista[1].trim() == '*') {
          resultado = int.parse(lista[0]) * int.parse(lista[2]);
          setState(() {
            total = "$resultado";
          });
        }

        if (lista[1].trim() == '/') {
          var dividendo = int.parse(lista[0]);
          var divisor = int.parse(lista[2]);
          if (divisor == 0) {
            total = "No es divisible por Cero";
          } else {
            double cociente = 0;
            cociente = dividendo / divisor;
            setState(() {
              total = "$cociente";
            });
          }
        }

        if (lista[1].trim() == '²') {
          resultado = int.parse(lista[0]) * int.parse(lista[0]);
          setState(() {
            total = "$resultado";
          });
        }

        if (lista[0].trim() == '√') {
          double raizpow = (double.parse(lista[1]));
          resultado = pow(raizpow, 1 / 2);
          setState(() {
            total = "$resultado";
          });
        }
        if (lista.length == 4) {
          if (lista[3].trim() == '%') {
            double porcentaje =
                (int.parse(lista[0]) * int.parse(lista[2])) / 100;
            setState(() {
              total = "$porcentaje";
            });
          }
        }
      }

      if (bandera == 1) {
        concatenaTotal.add(Text(total));
      }
      if (bandera == 0) {
        concatenaTotal.add(Text(total));
      }
    }
    operaciones = total;
  }
}

import 'package:calculator/views/opertaor_color.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'text_color.dart';

class CalcView extends StatefulWidget {
  const CalcView({super.key});

  @override
  State<CalcView> createState() => _CalcViewState();
}

class _CalcViewState extends State<CalcView> {
  List<String> symbols = [
    'C',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '+',
    '3',
    '2',
    '1',
    '-',
    'Ans',
    '0',
    '.',
    '=',
  ];
  String input = '55';
  String output = '222';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 187, 69, 5),
        title: const Text(
          "Calculator",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 30, letterSpacing: 4),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              child: Text(
                input,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              child: Text(
                output,
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
          ),
          Expanded(
              flex: 6,
              child: GridView.builder(
                  itemCount: symbols.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (symbols[index] == 'C') {
                          setState(() {
                            input = '';
                            output = '';
                          });
                        } else if (symbols[index] == 'Del') {
                          setState(() {
                            input = input.substring(0, input.length - 1);
                          });
                        } else if (symbols[index] == 'Ans') {
                          setState(() {
                            input = output;
                            output = '';
                          });
                        } else if (symbols[index] == '%' ||
                            symbols[index] == '/' ||
                            symbols[index] == '*' ||
                            symbols[index] == '+' ||
                            symbols[index] == '-') {
                          if (input.endsWith("%") ||
                              input.endsWith("*") ||
                              input.endsWith("/") ||
                              input.endsWith("+") ||
                              input.endsWith("-")) {
                            //
                          } else {
                            setState(() {
                              input += symbols[index];
                            });
                          }
                        } else if (symbols[index] == '=') {
                          Expression exp = Parser().parse(input);
                          double result =
                              exp.evaluate(EvaluationType.REAL, ContextModel());
                          setState(() {
                            output = result.toString();
                          });

                          //output
                        } else {
                          setState(() {
                            input += symbols[index];
                          });
                        }
                        //logic
                      },
                      child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: operatorBackground(symbols[index]),
                              borderRadius: BorderRadius.circular(35)),
                          alignment: Alignment.center,
                          child: Text(
                            symbols[index],
                            style: TextStyle(
                                color: TextColor(symbols[index]),
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          )),
                    );
                  }))
        ]),
      ),
    );
  }
}



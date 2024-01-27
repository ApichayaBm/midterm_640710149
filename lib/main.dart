import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String displayText = '0';

  static const addSign = "\u002B";
  static const subtractSign = "\u2212";
  static const multiplySign = "\u00D7";
  static const divideSign = "\u00F7";
  static const equalSign = "\u003D";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 0.0, color: Colors.white),
              borderRadius: BorderRadius.circular(0.0),
            ),
            alignment: Alignment.bottomRight,
            child: Text(
              displayText,
              style: TextStyle(fontSize: 34.0),
            ),
          ),
          buildButtonRow(['C', '⌫']),
          buildButtonRow(['7', '8', '9', divideSign]),
          buildButtonRow(['4', '5', '6', multiplySign]),
          buildButtonRow(['1', '2', '3', subtractSign]),
          buildButtonRow(['0', '+',addSign]),
          buildButtonRow([equalSign]),
        ],
      ),
    );
  }

  Widget buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttons
            .map(
              (button) => buildButton(
                button,
                isOperator(button) ? Colors.orange : Colors.white,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget buildButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () => onButtonPressed(text),
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.all(20.0),
        textStyle: TextStyle(fontSize: 20.0),
      ),
      child: Text(text),
    );
  }

  bool isOperator(String text) {
    return text == addSign ||
        text == subtractSign ||
        text == multiplySign ||
        text == divideSign ||
        text == equalSign;
  }

  void onButtonPressed(String buttonText) {
    setState(() {
      switch (buttonText) {
        case 'C':
          displayText = '0';
          break;
        case '⌫':
          if (displayText.length > 1) {
            displayText = displayText.substring(0, displayText.length - 1);
          } else {
            displayText = '0';
          }
          break;
        case '=':
          // Handle equal button press (perform calculation if needed)
          break;
        default:
          if (displayText == '0' || isOperator(displayText)) {
            displayText = buttonText;
          } else {
            displayText += buttonText;
          }
      }
    });
  }
}
// import 'package:flutter/material.dart';

// void main() {
//   runApp(CalculatorApp());
// }

// class CalculatorApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Calculator(),
//       ),
//     );
//   }
// }

// class Calculator extends StatefulWidget {
//   @override
//   _CalculatorState createState() => _CalculatorState();
// }

// class _CalculatorState extends State<Calculator> {
//   String displayText = '0';

//   static const addSign = "\u002B";
//   static const subtractSign = "\u2212";
//   static const multiplySign = "\u00D7";
//   static const divideSign = "\u00F7";
//   static const equalSign = "\u003D";

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.grey[200],
//       padding: EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 8.0),
//             padding: EdgeInsets.all(16.0),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(width: 0.0, color: Colors.white),
//               borderRadius: BorderRadius.circular(0.0),
//             ),
//             alignment: Alignment.bottomRight,
//             child: Text(
//               displayText,
//               style: TextStyle(fontSize: 24.0),
//             ),
//           ),
//         //    SizedBox(width: 16.0), //ความชิดกันระหว่างบล้อกต่อบล้อก
//         //     SizedBox.square(
//         //       child: Container(
//         //         width: 65.0,
//         //         height: 65.0,
//         //         decoration: BoxDecoration(
//         //           color: Colors.white,
//         //           border: Border.all(width: 0.7, color: Colors.grey),
//         //         ),
//         //         child: TextButton(
//         //           onPressed: () => addPin('6'),
//         //           child: Column(
//         //             mainAxisAlignment: MainAxisAlignment.center,
//         //             children: [
//         //               Text(
//         //                 '6',
//         //                 style: TextStyle(
//         //                     fontSize: 20.0,
//         //                     fontWeight: FontWeight.bold,
//         //                     color: Colors.black),
//         //               ),
//         //               // Text(
//         //               //   'six',
//         //               //   style: TextStyle(fontSize: 12.0, color: Colors.black),
//         //               // )
//         //             ],
//         //           ),
//         //         ),
//         //       ),
//         //     ),
//         //   ],
//         // ),
//           SizedBox(height: 65.0),
//           SizedBox(width: 40.0),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: ['7', '8', '9', divideSign]
//                 .map((button) => buildButton(
//                       button,
//                       isOperator(button) ? Colors.orange : Colors.white,
//                     ))
//                 .toList(),
//           ),
//           SizedBox(height: 65.0),
//           SizedBox(width: 40.0),
//           //SizedBox(width: 15.0),
//           //SizedBox(height: 35.0),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: ['4', '5', '6', multiplySign]
//                 .map((button) => buildButton(
//                       button,
//                       isOperator(button) ? Colors.orange : Colors.white,
//                     ))
//                 .toList(),
//           ),
//           SizedBox(height: 65.0),
//           SizedBox(width: 40.0),
//           //SizedBox(width: 15.0),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: ['1', '2', '3', subtractSign]
//                 .map((button) => buildButton(
//                       button,
//                       isOperator(button) ? Colors.orange : Colors.white,
//                     ))
//                 .toList(),
//           ),
//           SizedBox(height: 65.0),
//           SizedBox(width: 40.0),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: ['0',addSign]
//                 .map((button) => buildButton(
//                       button,
//                       isOperator(button) ? Colors.orange : Colors.white,
//                     ))
//                 .toList(),
//           ),
//         //   SizedBox(width: 16.0), //ความชิดกันระหว่างบล้อกต่อบล้อก
//         //     SizedBox.square(
//         //       child: Container(
//         //         width: 65.0,
//         //         height: 65.0,
//         //         decoration: BoxDecoration(
//         //           color: Colors.white,
//         //           border: Border.all(width: 0.7, color: Colors.grey),
//         //         ),
//         //       ),
//         //     ),
//         // ],
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [equalSign]
//                 .map((button) => buildButton(
//                       button,
//                       isOperator(button) ? Colors.orange : Colors.white,
//                     ))
//                 .toList(),
//           ),
//         ],
//       ),
//     );
//   }
//   //         buildButtonRow(['C', '⌫']),
//   //         buildButtonRow(['7', '8', '9', divideSign]),
//   //         buildButtonRow(['4', '5', '6', multiplySign]),
//   //         buildButtonRow(['1', '2', '3', subtractSign]),
//   //         buildButtonRow(['0',addSign]),
//   //         buildButtonRow([equalSign]),
//   //       ],
//   //     ),
//   //   );
//   // }

//   Widget buildButtonRow(List<String> buttons) {
//     return Expanded(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: buttons
//             .map(
//               (button) => buildButton(
//                 button,
//                 isOperator(button) ? Colors.orange : Colors.white,
//               ),
//             )
//             .toList(),
//       ),
//     );
//   }

//   Widget buildButton(String text, Color color) {
//     return ElevatedButton(
//       onPressed: () => onButtonPressed(text),
//       style: ElevatedButton.styleFrom(
//         primary: color,
//         padding: EdgeInsets.all(20.0),
//         textStyle: TextStyle(fontSize: 20.0),
//       ),
//       child: Text(text),
//     );
//   }

//   bool isOperator(String text) {
//     return text == addSign ||
//         text == subtractSign ||
//         text == multiplySign ||
//         text == divideSign ||
//         text == equalSign;
//   }

//   void onButtonPressed(String buttonText) {
//     setState(() {
//       switch (buttonText) {
//         case 'C':
//           displayText = '0';
//           break;
//         case '⌫':
//           if (displayText.length > 1) {
//             displayText = displayText.substring(0, displayText.length - 1);
//           } else {
//             displayText = '0';
//           }
//           break;
//         case '=':
//           // Handle equal button press (perform calculation if needed)
//           break;
//         default:
//           if (displayText == '0' || isOperator(displayText)) {
//             displayText = buttonText;
//           } else {
//             displayText += buttonText;
//           }
//       }
//     });
//   }
// } //อันเก่า


// import 'package:flutter/material.dart';

// void main() {
//   runApp(CalculatorApp());
// }

// class CalculatorApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Calculator(),
//       ),
//     );
//   }
// }

// class Calculator extends StatefulWidget {
//   @override
//   _CalculatorState createState() => _CalculatorState();
// }

// class _CalculatorState extends State<Calculator> {
//   String displayText = '0';

//   static const addSign = "\u002B";
//   static const subtractSign = "\u2212";
//   static const multiplySign = "\u00D7";
//   static const divideSign = "\u00F7";
//   static const equalSign = "\u003D";

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Container(
//           color: Colors.grey[200],
//       padding: EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 8.0),
//             padding: EdgeInsets.all(16.0),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(width: 0.0, color: Colors.white),
//               borderRadius: BorderRadius.circular(0.0),
//             ),
//             alignment: Alignment.bottomRight,
//             child: Text(
//               displayText,
//               style: TextStyle(fontSize: 24.0),
//             ),
//           ),
//           // color: Colors.grey[200],
//           // padding: EdgeInsets.all(8.0),
//           // child: Column(
//           //   crossAxisAlignment: CrossAxisAlignment.stretch,
//           //   children: <Widget>[
//           //     Text(
//           //       displayText.padRight(6, '_'),
//           //       style: TextStyle(fontSize: 20.0, color: Colors.black54),
//           //     ),
//           //     SizedBox(height: 100.0),
//           //     Row(
//           //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           //       children: [equalSign]
//           //           .map((button) => buildButton(
//           //                 button,
//           //                 isOperator(button) ? Colors.orange : Colors.white,
//           //               ))
//           //           .toList(),
//           //     ),
//           SizedBox(width: 16.0), //ความชิดกันระหว่างบล้อกต่อบล้อก
//             SizedBox.square(
//               child: Container(
//                 width: 65.0,
//                 height: 65.0,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(width: 0.7, color: Colors.grey),
//                 ),
//                 child: TextButton(
//                   //onPressed: () => displayText('6'),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       chil: ['C', '⌫']
//                     .map((button) => buildButton(
//                           button,
//                           isOperator(button) ? Colors.orange : Colors.white,
//                         ))
//                     .toList(),
//                       // Text(
//                       //   'six',
//                       //   style: TextStyle(fontSize: 12.0, color: Colors.black),
//                       // )
//                     ],
//                   ),
//                 ),
//               ),
//               // SizedBox(height: 100.0),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               //   children: ['C', '⌫']
//               //       .map((button) => buildButton(
//               //             button,
//               //             isOperator(button) ? Colors.orange : Colors.white,
//               //           ))
//               //       .toList(),
//               // ),
//               SizedBox(height: 100.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: ['7', '8', '9', divideSign]
//                     .map((button) => buildButton(
//                           button,
//                           isOperator(button) ? Colors.orange : Colors.white,
//                         ))
//                     .toList(),
//               ),
//               SizedBox(height: 100.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: ['4', '5', '6', multiplySign]
//                     .map((button) => buildButton(
//                           button,
//                           isOperator(button) ? Colors.orange : Colors.white,
//                         ))
//                     .toList(),
//               ),
//               SizedBox(height: constraints.maxHeight * 0.1),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: ['1', '2', '3', subtractSign]
//                     .map((button) => buildButton(
//                           button,
//                           isOperator(button) ? Colors.orange : Colors.white,
//                         ))
//                     .toList(),
//               ),
//               SizedBox(height: 100.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: ['0', '+', addSign]
//                     .map((button) => buildButton(
//                           button,
//                           isOperator(button) ? Colors.orange : Colors.white,
//                         ))
//                     .toList(),
//               ),
//               SizedBox(height: 100.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [equalSign]
//                     .map((button) => buildButton(
//                           button,
//                           isOperator(button) ? Colors.orange : Colors.white,
//                         ))
//                     .toList(),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void adddisplayText(String buttonText) {
//     setState(() {
//       if (displayText == '0') {
//         displayText = buttonText;
//       } else {
//         displayText += buttonText;
//       }
//     });
//   }

//   void onButtonPressed(String buttonText) {
//     setState(() {
//       switch (buttonText) {
//         case 'C':
//           displayText = '0';
//           break;
//         case '⌫':
//           if (displayText.length > 1) {
//             displayText = displayText.substring(0, displayText.length - 1);
//           } else {
//             displayText = '0';
//           }
//           break;
//         case '=':
//           // Handle equal button press (perform calculation if needed)
//           break;
//         default:
//           if (displayText == '0' || isOperator(displayText)) {
//             displayText = buttonText;
//           } else {
//             displayText += buttonText;
//           }
//       }
//     });
//   }

//   Widget buildButton(String text, Color color) {
//     return Container(
//       margin: EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         color: color,
//         border: Border.all(width: 0.7, color: Colors.grey),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: InkWell(
//         onTap: () {
//           if (!isOperator(text)) {
//             adddisplayText(text);
//           }
//           onButtonPressed(text);
//         },
//         child: Center(
//           child: Text(
//             text,
//             style: TextStyle(fontSize: 20.0),
//           ),
//         ),
//       ),
//     );
//   }

//   bool isOperator(String text) {
//     return text == addSign ||
//         text == subtractSign ||
//         text == multiplySign ||
//         text == divideSign ||
//         text == equalSign;
//   }
// }

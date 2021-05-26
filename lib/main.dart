import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Calculator(),
    );
  }
}

const Color cDark = Color(0xFF374352);
const Color cLight = Color(0xFFe6eeff);

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  bool dMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dMode ? cDark : cLight,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            setState(() {
              dMode ? dMode = false : dMode = true;
            });
          },
          child: _switchMode(),
        ),
      ),
      backgroundColor: dMode ? cDark : cLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // GestureDetector(
                    //   onTap: () {
                    //     setState(() {
                    //       dMode ? dMode = false : dMode = true;
                    //     });
                    //   },
                    //   child: _switchMode(),
                    // ),
                    // SizedBox(height: 80),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '1',
                        style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                            color: dMode ? Colors.white : Colors.red),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '=',
                          style: TextStyle(
                              fontSize: 35,
                              color: dMode ? Colors.green : Colors.grey),
                        ),
                        Text(
                          '1+2',
                          style: TextStyle(
                              fontSize: 20,
                              color: dMode ? Colors.green : Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              Container(
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonTopSet(title: 'sin'),
                      _buttonTopSet(title: 'cos'),
                      _buttonTopSet(title: 'tan'),
                      _buttonTopSet(title: '%')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildButtonRounded(
                          title: 'C',
                          textColor: dMode ? Colors.green : Colors.redAccent),
                      _buildButtonRounded(title: '('),
                      _buildButtonRounded(title: ')'),
                      _buildButtonRounded(
                          title: '/',
                          textColor: Color.fromRGBO(66, 133, 244, 1))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildButtonRounded(title: '7'),
                      _buildButtonRounded(title: '8'),
                      _buildButtonRounded(title: '9'),
                      _buildButtonRounded(
                          title: 'x',
                          textColor: Color.fromRGBO(66, 133, 244, 1))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildButtonRounded(title: '4'),
                      _buildButtonRounded(title: '5'),
                      _buildButtonRounded(title: '6'),
                      _buildButtonRounded(
                          title: '-',
                          textColor: Color.fromRGBO(66, 133, 244, 1))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildButtonRounded(title: '1'),
                      _buildButtonRounded(title: '2'),
                      _buildButtonRounded(title: '3'),
                      _buildButtonRounded(
                          title: '+',
                          textColor: Color.fromRGBO(66, 133, 244, 1))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildButtonRounded(title: '0'),
                      _buildButtonRounded(title: ','),
                      _buildButtonRounded(
                          icon: Icons.backspace_outlined,
                          iconColor: Colors.redAccent),
                      _buildButtonRounded(
                          title: '=',
                          textColor: dMode ? Colors.green : Colors.redAccent)
                    ],
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonRounded(
      {String title,
      double padding = 17,
      IconData icon,
      Color iconColor,
      Color textColor}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: NeuMorph(
        dMode: dMode,
        borderRadius: BorderRadius.circular(40),
        padding: EdgeInsets.all(padding),
        child: Container(
          width: padding * 2,
          height: padding * 2,
          child: Center(
              child: title != null
                  ? Text(
                      '$title',
                      style: TextStyle(
                          color: textColor != null
                              ? textColor
                              : dMode
                                  ? Colors.white
                                  : Colors.black,
                          fontSize: 30),
                    )
                  : Icon(
                      icon,
                      color: iconColor,
                      size: 30,
                    )),
        ),
      ),
    );
  }

  Widget _buttonTopSet({String title, double padding = 17}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: NeuMorph(
        dMode: dMode,
        borderRadius: BorderRadius.circular(50),
        padding:
            EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
        child: Container(
          width: padding * 2,
          child: Center(
            child: Text(
              '$title',
              style: TextStyle(
                  color: dMode ? Colors.white : Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _switchMode() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: 50,
      child: Row(children: [
        Icon(
          dMode ? Icons.nightlight_round : Icons.wb_sunny,
          color: dMode ? Colors.grey : Colors.redAccent,
        ),
      ]),
    );
  }
}

class NeuMorph extends StatefulWidget {
  final bool dMode;
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  NeuMorph({this.dMode = false, this.child, this.borderRadius, this.padding});
  @override
  _NeuMorphState createState() => _NeuMorphState();
}

class _NeuMorphState extends State<NeuMorph> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool dMode = widget.dMode;
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
            color: dMode ? cDark : cLight,
            borderRadius: widget.borderRadius,
            boxShadow: _isPressed
                ? null
                : [
                    BoxShadow(
                      color: dMode ? Colors.black54 : Colors.blueGrey.shade200,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                        color: dMode ? Colors.blueGrey.shade700 : Colors.white,
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0)
                  ]),
        child: widget.child,
      ),
    );
  }
}

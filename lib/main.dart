import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0';
  double _num1 = 0;
  double _num2 = 0;
  String _operand = '';
  bool _operandClicked = false;

  void _onNumberClick(String value) {
    setState(() {
      if (_operandClicked) {
        _output = value;
        _operandClicked = false;
      } else {
        _output = _output == '0' ? value : _output + value;
      }
    });
  }

  void _onOperandClick(String value) {
    setState(() {
      _operand = value;
      _num1 = double.parse(_output);
      _operandClicked = true;
    });
  }

  void _onEqualsClick() {
    setState(() {
      _num2 = double.parse(_output);
      switch (_operand) {
        case '+':
          _output = (_num1 + _num2).toString();
          break;
        case '-':
          _output = (_num1 - _num2).toString();
          break;
        case 'x':
          _output = (_num1 * _num2).toString();
          break;
        case '/':
          _output = (_num1 / _num2).toString();
          break;
      }
      _operand = '';
    });
  }

  void _onClearClick() {
    setState(() {
      _output = '0';
      _num1 = 0;
      _num2 = 0;
      _operand = '';
      _operandClicked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(70.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: TextStyle(fontSize: 48.0),
              ),
            ),
          ),
          Row(
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildOperandButton('/'),
            ],
          ),
          Row(
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildOperandButton('x'),
            ],
          ),
          Row(
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildOperandButton('-'),
            ],
          ),
          Row(
            children: [
              _buildButton('0'),
              _buildButton('.'),
              _buildEqualsButton(),
              _buildOperandButton('+'),
            ],
          ),
          Row(
            children: [
              _buildClearButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String value) {
    return Expanded(
      child: FloatingActionButton(
        onPressed: () => _onNumberClick(value),
        child: Text(value, style: TextStyle(fontSize: 24.0)),
      ),
    );
  }

  Widget _buildOperandButton(String value) {
    return Expanded(
      child: FloatingActionButton(
        onPressed: () => _onOperandClick(value),
        child: Text(value, style: TextStyle(fontSize: 24.0)),
      ),
    );
  }

  Widget _buildEqualsButton() {
    return Expanded(
      child: FloatingActionButton(
        onPressed: _onEqualsClick,
        child: Text('=', style: TextStyle(fontSize: 24.0)),
      ),
    );
  }

  Widget _buildClearButton() {
    return Expanded(
      child: FloatingActionButton(
        onPressed: _onClearClick,
        child: Text('C', style: TextStyle(fontSize: 24.0)),
      ),
    );
  }
}

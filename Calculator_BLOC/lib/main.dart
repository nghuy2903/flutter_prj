import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'calculator_bloc.dart';
import 'calculator_event.dart';
import 'calculator_state.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CalculatorBloc(),
        child: CalculatorScreen(),
      ),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  void _calculate(BuildContext context, String operation) {
    double num1 = double.tryParse(_controller1.text) ?? 0;
    double num2 = double.tryParse(_controller2.text) ?? 0;
    context.read<CalculatorBloc>().add(Calculate(num1, num2, operation));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator Demo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Giá trị 1"),
            ),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Giá trị 2"),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['+', '-', 'x', '/'].map((op) {
                return ElevatedButton(
                  onPressed: () => _calculate(context, op),
                  child: Text(op, style: const TextStyle(fontSize: 20)),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            BlocBuilder<CalculatorBloc, CalculatorState>(
              builder: (context, state) {
                if (state is CalculatorResult) {
                  return Text(
                    "Kết quả: ${state.result}",
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  );
                }
                return const Text("Kết quả: 0", style: TextStyle(fontSize: 24));
              },
            ),
          ],
        ),
      ),
    );
  }
}

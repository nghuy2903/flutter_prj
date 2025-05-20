import 'package:equatable/equatable.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();
  @override
  List<Object> get props => [];
}

class Calculate extends CalculatorEvent {
  final double value1;
  final double value2;
  final String operation;

  const Calculate(this.value1, this.value2, this.operation);

  @override
  List<Object> get props => [value1, value2, operation];
}

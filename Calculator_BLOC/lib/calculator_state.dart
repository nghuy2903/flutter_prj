import 'package:equatable/equatable.dart';

abstract class CalculatorState extends Equatable {
  const CalculatorState();
  @override
  List<Object> get props => [];
}

class CalculatorInitial extends CalculatorState {}

class CalculatorResult extends CalculatorState {
  final double result;
  const CalculatorResult(this.result);

  @override
  List<Object> get props => [result];
}

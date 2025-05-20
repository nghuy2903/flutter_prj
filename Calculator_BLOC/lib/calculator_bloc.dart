import 'package:flutter_bloc/flutter_bloc.dart';
import 'calculator_event.dart';
import 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorInitial()) {
    on<Calculate>((event, emit) {
      double result = 0.0;
      switch (event.operation) {
        case '+':
          result = event.value1 + event.value2;
          break;
        case '-':
          result = event.value1 - event.value2;
          break;
        case 'x':
          result = event.value1 * event.value2;
          break;
        case '/':
          result = event.value2 != 0 ? event.value1 / event.value2 : double.nan;
          break;
      }
      emit(CalculatorResult(result));
    });
  }
}

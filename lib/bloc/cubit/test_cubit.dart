import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'test_state.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  void increment() => emit(state + 1);
}

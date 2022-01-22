import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit_states.dart';

class AppCubit extends Cubit {
  AppCubit() : super(InitialState()) {
    emit(WelcomeState());
  }
}

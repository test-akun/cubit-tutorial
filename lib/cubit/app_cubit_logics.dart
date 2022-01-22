import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit.dart';
import 'package:flutter_cubit/cubit/app_cubit_states.dart';

class AppCubitLogics extends StatelessWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return Container(
              decoration: const BoxDecoration(color: Colors.red),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/core/theme/gradient_cubit/gradient_state.dart';

class GradientCubit extends Cubit<GradientState> {
  GradientCubit()
      : super(const GradientState(
          LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFB3E0FF), Color(0xFF4A90E2)],
          ),
        ));

  void setGradient(Gradient gradient) => emit(GradientState(gradient));
}

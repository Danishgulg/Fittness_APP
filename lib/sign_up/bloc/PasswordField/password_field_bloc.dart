import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'password_field_event.dart';
part 'password_field_state.dart';

class PasswordFieldBloc extends Bloc<PasswordFieldEvent, PasswordFieldState> {
  PasswordFieldBloc()
      : super(
            const PasswordFieldState(color: Colors.blueGrey, obsqure: true)) {
    on<PassWordVisibilityEvent>((event, emit) {
      if (event.isVisible) {
        emit(const PasswordFieldState(color: Colors.blue, obsqure: false));
      } else {
        emit(const PasswordFieldState(color: Colors.blueGrey, obsqure: true));
      }
    });
  }
}

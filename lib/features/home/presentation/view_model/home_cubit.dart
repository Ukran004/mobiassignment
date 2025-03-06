import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  void onTabTapped(int index) {
    if (index >= 0 && index < state.views.length) {
      emit(state.copyWith(selectedIndex: index));
    }
  }

  void logout(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/login');
  }
}
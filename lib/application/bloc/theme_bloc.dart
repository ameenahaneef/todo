import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial(themeData: ThemeData.light())) {
    on<ToggleTheme>((event, emit) {
      if(state is ThemeInitial){
        final currentTheme=(state as ThemeInitial).themeData;
        final isLightTheme=currentTheme.brightness==Brightness.light;
        emit(ThemeInitial(themeData: isLightTheme?ThemeData.dark():ThemeData.light()));
      }
    });
  }
}

import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'color_change_state.dart';

class ColorChangeCubit extends Cubit<ColorChangeState> {
  ColorChangeCubit() : super(ColorChangeInitial());

  void chnageColor({Color? color}) {
    emit(AppColorChange(color: color));
  }

  void chnageText(String s) {

  }
}

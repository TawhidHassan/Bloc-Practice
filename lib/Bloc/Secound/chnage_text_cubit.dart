import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chnage_text_state.dart';

class ChnageTextCubit extends Cubit<ChnageTextState> {
  ChnageTextCubit() : super(ChnageTextInitial());

  void chnageText(String s) {
    emit(ChnageText(text: s));
  }
}

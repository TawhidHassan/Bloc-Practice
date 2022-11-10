part of 'chnage_text_cubit.dart';

@immutable
abstract class ChnageTextState {}

class ChnageTextInitial extends ChnageTextState {}
class ChnageText extends ChnageTextState {
  final String? text;

  ChnageText({this.text});
}

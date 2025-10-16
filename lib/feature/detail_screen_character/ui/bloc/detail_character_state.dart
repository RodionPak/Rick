part of 'detail_character_bloc.dart';

@immutable
sealed class DetailCharacterState {
  const DetailCharacterState();
}

final class DetailCharacterInitial extends DetailCharacterState {}
final class DetailCharacterLoadState extends DetailCharacterState {}
final class ErrorGetCharacterState extends DetailCharacterState {


}

final class SuccessGetDetailCharacterState extends DetailCharacterState {
  final Character model;

  const SuccessGetDetailCharacterState({required this.model});
}

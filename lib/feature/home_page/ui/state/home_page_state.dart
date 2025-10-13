part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState {
  const HomePageState();
}

final class HomePageInitial extends HomePageState {}

final class SuccessGetCharacterState extends HomePageState {
  final CharactersModel model;

  const SuccessGetCharacterState({required this.model});
}

part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {
  const HomePageEvent();
}

final class GetDataCharacterEvent extends HomePageEvent {}

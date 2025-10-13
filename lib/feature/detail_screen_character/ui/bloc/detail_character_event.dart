part of 'detail_character_bloc.dart';

@immutable
sealed class DetailCharacterEvent {
  const DetailCharacterEvent();
}

final class GetSingleCharacterEvent extends DetailCharacterEvent {
  final int id;

  const GetSingleCharacterEvent({required this.id});
}

part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {}

class GetBreedsEvent extends HomePageEvent {}

class GetBreedsByNameEvent extends HomePageEvent {
  final String breed;
  GetBreedsByNameEvent(this.breed);
}

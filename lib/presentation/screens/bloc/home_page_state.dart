part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState {}

final class HomePageInitial extends HomePageState {}

final class HomePageLoading extends HomePageState {}

final class HomePageLoaded extends HomePageState {
  final List<BreedsModel> breedsList;
  HomePageLoaded(this.breedsList);
}

final class HomePageError extends HomePageState {
  final String message;
  HomePageError(this.message);
}

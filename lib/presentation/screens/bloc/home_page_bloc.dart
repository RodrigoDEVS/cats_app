import 'package:bloc/bloc.dart';
import 'package:gatos_app/data/datasources/cats_api_source.dart';
import 'package:gatos_app/data/models/breeds_model.dart';
import 'package:gatos_app/data/repositories/cats_repository_impl.dart';
import 'package:gatos_app/domain/usecases/get_breeds.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    // Inyección de dependencias
    final catsApiSource = CatsApiSource();
    final catsRepository = CatsRepositoryImpl(catsApiSource);
    final getBreedsUseCase = GetBreeds(catsRepository);
    on<GetBreedsEvent>((event, emit) async {
      emit(HomePageLoading());
      try {
        final breedList = await getBreedsUseCase.getBreeds();
        emit(HomePageLoaded(breedList));
      } catch (error) {
        emit(HomePageError(error.toString()));
      }
    });
    on<GetBreedsByNameEvent>((event, emit) async {
      emit(HomePageLoading());
      try {
        final breedList = await getBreedsUseCase.getCatsByBreed(event.breed);
        emit(HomePageLoaded(breedList));
      } catch (error) {
        emit(HomePageError(error.toString()));
      }
    });
  }
}

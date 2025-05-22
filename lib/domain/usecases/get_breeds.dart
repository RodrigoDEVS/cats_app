import 'package:gatos_app/data/models/breeds_model.dart';
import 'package:gatos_app/data/repositories/cats_repository.dart';

class GetBreeds {
  final CatsRepository repository;
  GetBreeds(this.repository);

  Future<List<BreedsModel>> getBreeds() async {
    return await repository.getBreeds();
  }

  Future<List<BreedsModel>> getCatsByBreed(String breed) async {
    return await repository.getCatsByBreed(breed);
  }
}

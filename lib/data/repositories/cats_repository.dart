import 'package:gatos_app/data/models/breeds_model.dart';

abstract class CatsRepository {
  Future<List<BreedsModel>> getBreeds();

  Future<List<BreedsModel>> getCatsByBreed(String breed);
}

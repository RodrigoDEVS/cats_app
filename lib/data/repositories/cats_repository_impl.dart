import 'package:gatos_app/data/cats_model.dart';
import 'package:gatos_app/data/models/breeds_model.dart';
import 'package:gatos_app/data/repositories/cats_repository.dart';

import '../datasources/cats_api_source.dart';

class CatsRepositoryImpl extends CatsRepository {
  final CatsApiSource catsApiSource;
  CatsRepositoryImpl(this.catsApiSource);
  @override
  Future<List<BreedsModel>> getBreeds() async {
    return await catsApiSource.getBreeds();
  }

  @override
  Future<List<BreedsModel>> getCatsByBreed(String breed) async {
    return await catsApiSource.getCatsByBreed(breed);
  }
}

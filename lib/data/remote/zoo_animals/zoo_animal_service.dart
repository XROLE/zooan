import 'package:zooan/domain/models/zoo_animal_model.dart';

abstract class ZooAnimalService {
  Future<ZooAnimalModel> getOneRandomZooAnimal();
}

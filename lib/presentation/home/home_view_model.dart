import 'package:zooan/data/remote/zoo_animals/zoo_animal_service.dart';
import 'package:zooan/presentation/base/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  final ZooAnimalService zooAnimalService;
  HomeViewModel(this.zooAnimalService);

  void init() {
    zooAnimalService.getOneRandomZooAnimal();
  }
}

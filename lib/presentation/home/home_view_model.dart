import 'package:zooan/data/remote/zoo_animals/zoo_animal_service.dart';
import 'package:zooan/domain/models/zoo_animal_model.dart';
import 'package:zooan/presentation/base/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  final ZooAnimalService zooAnimalService;
  HomeViewModel(this.zooAnimalService);
  ZooAnimalModel _animal;

  ZooAnimalModel get animal => _animal;
  set animal(ZooAnimalModel val) {
    _animal = val;

    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;

    notifyListeners();
  }

  Future<void> getAnimal() async {

    isLoading = true;
    animal = await zooAnimalService.getOneRandomZooAnimal();
    isLoading = false;
  }
}

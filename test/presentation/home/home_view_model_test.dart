import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:zooan/app/core/client/http_client.dart';
import 'package:zooan/data/remote/zoo_animals/zoo_animal_service.dart';
import 'package:zooan/domain/models/zoo_animal_model.dart';
import 'package:zooan/presentation/home/home_view_model.dart';

class MockHttpClient extends Mock implements HttpClient {}

ZooAnimalModel animal = ZooAnimalModel(
  name: 'Bat',
  activeTime: 'Nuctonal',
  animalType: 'Mammal',
);

class MockZooAnimalService extends Mock implements ZooAnimalService {
  MockZooAnimalService();

  @override
  Future<ZooAnimalModel> getOneRandomZooAnimal() async {
    return Future.delayed(Duration(seconds: 2), () => animal);
  }
}

void main() {
  group('Test Home view model', () {
    MockZooAnimalService mockZooAnimalService = MockZooAnimalService();
    HomeViewModel homeViewModel = HomeViewModel(mockZooAnimalService);

    test('Ensure that get animal method is called', () async {
      expect(homeViewModel.animal, null);
      await homeViewModel.getAnimal();
      expect(homeViewModel.animal, animal);
    });
  });
}

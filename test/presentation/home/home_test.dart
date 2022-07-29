import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:zooan/data/remote/zoo_animals/zoo_animal_service.dart';
import 'package:zooan/domain/models/zoo_animal_model.dart';
import 'package:zooan/presentation/base/base_view.dart';
import 'package:zooan/presentation/home/home.dart';
import 'package:zooan/presentation/home/home_view_model.dart';

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

MockZooAnimalService mockZooAnimalService = MockZooAnimalService();

Widget createHomePage() => MaterialApp(
      home: BaseView<HomeViewModel>(
        model: HomeViewModel(mockZooAnimalService),
        onModelReady: (model) => model.getAnimal(),
        builder: (context, model, _) => Home(
          model: model,
        ),
      ),
    );

void main() {
  testWidgets('Test the home screen widget', (WidgetTester tester) async {
    await tester.pumpWidget(createHomePage());
    await tester.pumpAndSettle();

    final findName = find.text('Name:');
    final findTitle = find.text('Zooan');
    final findLatinName = find.text('Latin name:');
    final findAnimalType = find.text('Animal Type:');
    final findActiveTime = find.text('Active time:');
    final findLifeSpan = find.text('Life span:');
    final findNextButton= find.text('Next');

    expect(findName, findsOneWidget);
    expect(findTitle, findsOneWidget);
    expect(findLatinName, findsOneWidget);
    expect(findAnimalType, findsOneWidget);
    expect(findActiveTime, findsOneWidget);
    expect(findLifeSpan, findsOneWidget);
    expect(findNextButton, findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:zooan/data/remote/zoo_animals/zoo_animal_service.dart';

class HomeViewModel extends ChangeNotifier {
  final ZooAnimalService zooAnimalService;
  HomeViewModel(this.zooAnimalService);

  void init() {
    zooAnimalService.getOneRandomZooAnimal();
  }
}

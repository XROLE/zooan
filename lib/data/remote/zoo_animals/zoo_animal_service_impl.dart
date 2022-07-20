import 'package:dio/dio.dart';
import 'package:zooan/app/core/client/http_client.dart';
import 'package:zooan/app/core/endpoints/endpoints.dart';
import 'package:zooan/data/remote/zoo_animals/zoo_animal_service.dart';
import 'package:zooan/domain/models/zoo_animal_model.dart';

class ZooAnimalServiceImpl implements ZooAnimalService {
  final HttpClient httpClient;
  ZooAnimalServiceImpl(this.httpClient);
  @override
  Future<ZooAnimalModel> getOneRandomZooAnimal() async {
    try {
      String url = Endpoints.getOneRandomZooAnimal();

      Response res = await httpClient.get(url);
      print(res);
      return ZooAnimalModel.fromJson(res.data);
    } catch (e) {
      print('An Error occured: $e');
    }
  }
}

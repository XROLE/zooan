import 'package:get_it/get_it.dart';
import 'package:zooan/app/core/client/http_client.dart';
import 'package:zooan/app/core/client/http_client_impl.dart';
import 'package:zooan/data/remote/zoo_animals/zoo_animal_service.dart';
import 'package:zooan/data/remote/zoo_animals/zoo_animal_service_impl.dart';

GetIt sl = GetIt.instance;

Future<void> setUpServiceLocator() async {
  sl.registerSingleton<HttpClient>(HttpClient());
  sl.registerLazySingleton<ZooAnimalService>(() => ZooAnimalServiceImpl(sl.get()));
}

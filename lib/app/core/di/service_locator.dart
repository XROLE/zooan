import 'package:get_it/get_it.dart';
import 'package:zooan/app/core/client/http_client.dart';
import 'package:zooan/app/core/client/http_client_impl.dart';

GetIt sl = GetIt.instance;

Future<void> setUpServiceLocator() async {
  sl.registerSingleton<HttpClient>(HttpClient());

}

import 'package:flutter/material.dart';
import 'package:zooan/app/core/di/service_locator.dart';
import 'package:zooan/data/remote/zoo_animals/zoo_animal_service.dart';
import 'package:zooan/presentation/base/base_view.dart';
import 'package:zooan/presentation/home/home_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      model: HomeViewModel(sl<ZooAnimalService>()),
      onModelReady: (model) => model.init(),
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(
          title: Text('Zooan'),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: List.generate(5, (i) => Text('I am a chosen one $i')),
            )),
      ),
    );
  }
}

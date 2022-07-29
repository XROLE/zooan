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
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      model: HomeViewModel(sl<ZooAnimalService>()),
      onModelReady: (model) => model.getAnimal(),
      builder: (context, model, _) => Home(model: model,),
    );
  }
}

class Home extends StatelessWidget {
  final HomeViewModel model;
  const Home({
    Key key,
    @required this.model
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zooan'),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Row(
              children: [
                Text(
                  'Name:',
                ),
                SizedBox(width: 5),
                Text(
                  model.animal?.name ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  'Latin name:',
                ),
                SizedBox(width: 5),
                Text(
                  model.animal?.latinName ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  'Animal Type:',
                ),
                SizedBox(width: 5),
                Text(
                  model.animal?.animalType ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Active time:',
                ),
                SizedBox(width: 5),
                Text(
                  model.animal?.activeTime ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Life span:',
                ),
                SizedBox(width: 5),
                Text(
                  model.animal?.lifespan ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 20),
            model.animal?.imageLink != null
                ? Container(
                    height: 300,
                    color: Colors.amberAccent,
                    child: Image.network(
                      model.animal?.imageLink,
                    ),
                  )
                : SizedBox(),
            SizedBox(height: 50),
            InkWell(
              onTap: model.isLoading
                  ? () {}
                  : () {
                      model.getAnimal();
                    },
              child: Container(
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: model.isLoading ? Colors.grey : Colors.blue,
                    borderRadius: BorderRadius.circular(50)),
                child: model.isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
              ),
            )
          ])),
    );
  }
}

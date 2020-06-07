import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:todo_app/app/modules/home/components/card_home_widget.dart';
import 'package:todo_app/app/shared/consts.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  List<Icon> icons = [
    Icon(Icons.add_box, color: Colors.blue, size: 30),
    Icon(Icons.card_travel, color: Colors.yellow, size: 30),
    Icon(Icons.library_books, color: Colors.purple, size: 30),
    Icon(Icons.home, color: Colors.red, size: 30),
  ];
  @override
  void initState() {
      controller.initBoxes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {




    double screenHeight = MediaQuery.of(context).padding.top;
    controller.mainInit();
  
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: Column(
          children: <Widget>[
            Container(height: screenHeight),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, top: 30),
                  child: Text(
                    "Lists",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Observer(
                builder: (_) {
                  return Container(
                    child: Container(
                      child: AnimationLimiter(
                        child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.all(10),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          addAutomaticKeepAlives: true,
                          itemCount: controller.mainList.length,
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: Duration(microseconds: 350),
                              columnCount: 2,
                              child: ScaleAnimation(
                                child: GestureDetector(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CardHomeWidget(
                                        index: index,
                                        icon: index <= 3 ? ConstsApp.icons[index]  : Icon(Icons.add),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/details/${controller.mainList[index]}',
                                      );
                                    },
                                    onLongPress: () {
                                      if (index >= 4) {
                                            controller.mainRemove(index);
                                      } 
                                    }),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );

                  //ItemWidget(index: index, nameList: 'all',);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showDialog();
          },
          child: Icon(Icons.add)),
    );
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Observer(
            builder: (_) {
              return AlertDialog(
                title: Text('Adicionar Lista'),
                content: TextField(
                  onChanged: controller.setText,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Nova Lista'),
                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Modular.to.pop();
                    },
                    child: Text('Cancelar'),
                  ),
                  FlatButton(
                    onPressed: controller.text.isEmpty
                        ? null
                        : () {
                            controller.mainSave();
                            Modular.to.pop();
                          },
                    child: Text('Salvar'),
                  ),
                ],
              );
            },
          );
        });
  }
}

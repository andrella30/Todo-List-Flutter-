import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:todo_app/app/modules/home/components/item_widget.dart';
import 'package:todo_app/app/modules/home/home_controller.dart';
import 'package:todo_app/app/shared/consts.dart';

class DetailsPage extends StatefulWidget {
  final String listName;

  DetailsPage({Key key, this.listName}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState(listName);
}

class _DetailsPageState extends State<DetailsPage> {
  double _progress;
  double _multiple;
  double _opacity;
  double _opacityTitle;

  final String listName;
  final HomeController controller = Modular.get();

  _DetailsPageState(this.listName);

  @override
  void initState() {
    super.initState();
    _progress = 1;
    _multiple = 1;
    _opacity = 1;
    _opacityTitle = 0;
  }

  double interval(double lower, double upper, double progress) {
    assert(lower < upper);

    if (progress > upper) return 1.0;
    if (progress < lower) return 0.0;

    return ((progress - lower) / (upper - lower)).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
  //  double screenHeight = MediaQuery.of(context).padding.top;

    controller.init(widget.listName);
    return Scaffold(
      appBar: AppBar(
        title: Opacity(
          opacity: _opacityTitle,
          child: Text(widget.listName),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.blue,
            height: MediaQuery.of(context).size.height / 3,
          ),
          SlidingSheet(
            listener: (state) {
              setState(() {
                _progress = state.progress;
                _multiple = 1 - interval(0.0, 0.7, _progress);
                _opacity = _multiple;
                _opacityTitle = _multiple = interval(0.0, 0.7, _progress);
                
              });
            },
            elevation: 0,
            cornerRadius: 16,
            snapSpec: SnapSpec(
              snap: true,
              snappings: [0.7, 1.0],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Observer(
                    builder: (_) {
                      return controller.list != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height - 40,
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.only(top: 5),
                                        itemCount: controller.list.length,
                                        itemBuilder: (_, index) {
                                          return ItemWidget(
                                            index: index,
                                            nameList: widget.listName,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
                top: _opacityTitle == 1 ? 1000 : 20 - _progress * 10, left: 10),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Opacity(
                opacity: _opacity,
                child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: ConstsApp.icones(listName) != null
                        ? ConstsApp.icones(listName)
                        : Icon(Icons.add)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: _opacityTitle == 1 ? 1000 : 80 - _progress * 10, left: 10),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Opacity(
                  opacity: _opacity,
                  child: Text(
                    listName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: _opacityTitle == 1 ? 1000 : 110 - _progress * 10,
                  left: 10),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Opacity(
                  opacity: _opacity,
                  child: Observer(builder: (_) {
                    return Text(
                      controller.list.length.toString() + ' tasks',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    );
                  }),
                ),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showDialog(),
      ),
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
                            controller.save(listName);
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

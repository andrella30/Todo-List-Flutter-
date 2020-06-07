import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/home/home_controller.dart';

class ItemWidget extends StatelessWidget {
  final HomeController controller = Modular.get();
  final int index;
  final String nameList;

  ItemWidget({Key key, this.index, this.nameList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.init(nameList);
    return Observer(
      builder: (_) {
        return Card(
          color: Colors.grey[50],
          child: ListTile(
            onTap: () {
              _showDialog(context);
            },
            title: Text(controller.list[index], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            trailing: IconButton(
              icon: Icon(
                Icons.cancel,
                color: Colors.red,
              ),
              onPressed: () {
                controller.remove(index, nameList);
                
              },
            ),
            
          ),
        );
      },
    );
  }


    _showDialog(context) {
    showDialog(
        context: context,
        builder: (_) {
          return Observer(
            builder: (_) {
              return AlertDialog(
                title: Text('Editar'),
                content: TextField(
                  onChanged: controller.setText,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Editar Tarefa'),
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
                          controller.edit(index, nameList);
                          //  controller.remove(index, nameList);
                            //controller.save(nameList);
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

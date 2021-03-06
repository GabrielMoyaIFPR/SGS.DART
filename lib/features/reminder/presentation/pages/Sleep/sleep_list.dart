import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:sgs/features/reminder/domain/entities/sleep.dart';
import 'package:sgs/features/reminder/presentation/pages/Reminders/reminder_list.dart';
import 'package:sgs/features/reminder/presentation/pages/Sleep/sleep_list_back.dart';
import 'package:sgs/features/reminder/presentation/pages/Users/user_list.dart';

class SleepList extends StatelessWidget {

 final _back = SleepListBack();

Widget iconEditButton(Function onPressed){
  return IconButton(icon: Icon(Icons.edit), color:Colors.blue, onPressed:onPressed);
}
Widget iconRemoveButton(BuildContext context, Function remove){
  return IconButton(
    icon: Icon(Icons.delete),
    color:Colors.red,
    onPressed:(){
      showDialog(
        context: context,builder: (context)=> AlertDialog(
          title:Text('Excluir'),
          content: Text('Confirmar exclusão?'),
          actions: [
            FlatButton(
              child: Text('Não'),
              onPressed: (){
              Navigator.of(context).pop();
              }
            ),
            FlatButton(
              child: Text('Sim'),
              onPressed: remove
            ),
          ],
        )
        );
  });
}

 @override
  Widget build(BuildContext context) {
          return Scaffold(
                appBar: AppBar(
                  title: Text('Lista de Registros'),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                         _back.goToForm(context);
                      },
                    ),
                    IconButton(
                        icon: Icon(Icons.home),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => UserList()));
                      }
                    ),
                    IconButton(
                        icon: Icon(Icons.note_add),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => ReminderList()));
                      }
                    )
                  ],
                ),
                body: Observer(builder:(context) {
                  return FutureBuilder(
                    future: _back.list,
                    builder: (context, futuro){
                    if(!futuro.hasData){
                    return CircularProgressIndicator();
                    }else{
                      List<Sleep> lista = futuro.data;
                      return ListView.builder(
                      itemCount: lista.length,
                      itemBuilder: (context, i) {
                        var contato = lista[i];
                        // var dataInicial = contato.dataInicial.toList();
                        // var dataFinal = contato.dataInicial.toList();
                      return ListTile(
                          onTap: (){
                            _back.goToDetails(context, contato);
                          },
                          // title: Text(dataInicial),
                          // subtitle: Text(dataFinal),
                          trailing: Container(
                            width: 100,
                            child: Row(
                              children: [
                                iconEditButton((){
                                  _back.goToForm(context, contato);
                                }),
                                iconRemoveButton(context, (){
                                  _back.remove(contato.id);
                                  Navigator.of(context).pop();
                                })
                                    
                              ],
                            ),
                          ),
                        );
                      }
                    );
                  }
                }
              );
            }
          )
        );
      } 
}

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:sgs/features/reminder/domain/entities/reminder.dart';
import 'package:sgs/features/reminder/presentation/pages/Reminders/reminder_list_back.dart';

class ReminderList extends StatelessWidget {

 final _back = ReminderListBack();

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
                  title: Text('Lista de Usuários'),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                         _back.goToForm(context);
                      },
                    ),
                  ],
                ),
                body: Observer(builder:(context) {
                  return FutureBuilder(
                    future: _back.list,
                    builder: (context, futuro){
                    if(!futuro.hasData){
                    return CircularProgressIndicator();
                    }else{
                      List<Reminder> lista = futuro.data;
                      return ListView.builder(
                      itemCount: lista.length,
                      itemBuilder: (context, i) {
                        var contato = lista[i];
                       
                      return ListTile(
                          onTap: (){
                            _back.goToDetails(context, contato);
                          },
                          title: Text(contato.titulo),
                          subtitle: Text(contato.descricao),
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

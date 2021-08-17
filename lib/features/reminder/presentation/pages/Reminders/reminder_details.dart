import 'package:flutter/material.dart';
import 'package:sgs/features/reminder/domain/entities/reminder.dart';
import 'package:sgs/features/reminder/presentation/pages/Reminders/reminder_details_back.dart';
import 'package:url_launcher/url_launcher.dart';

class ReminderDetails extends StatelessWidget {
  launchApp(String url, context) async{
    await canLaunch(url)? await launch(url): showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Alerta'),
          content: Text('Não foi possível encontrar um APP compatível'),

        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
      var _back = ReminderDetailsBack(context);
      Reminder reminder = _back.reminder;
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          var width = constraints.biggest.width;
          return Scaffold(
            body: ListView(
              padding: EdgeInsets.all(60),
              children: [
                Card(
                  child: ListTile(
                    title: Text("Título:"),
                    subtitle: Text('${reminder.titulo}'),
                    trailing: Container(
                      width: width/4,
                      ),
                    ),
                ),
                Card(
                child: ListTile(
                  title: Text("Descrição:"),
                  subtitle: Text('${reminder.descricao}'),
                  trailing: Container(
                    width: width / 4,
                  ),
                ),
              ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.arrow_back),
              onPressed: (){
                _back.goToBack();
              }
            ),
        );
        },
      );
  }
}
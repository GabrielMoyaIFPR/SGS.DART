import 'package:flutter/material.dart';
import 'package:sgs/features/reminder/domain/entities/user.dart';
import 'package:sgs/features/reminder/presentation/pages/Users/user_details_back.dart';

import 'package:url_launcher/url_launcher.dart';

class UserDetails extends StatelessWidget {
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
      var _back = UserDetailsBack(context);
      User user = _back.user;
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          var width = constraints.biggest.width;
          return Scaffold(
            body: ListView(
              padding: EdgeInsets.all(60),
              children: [
                Center(
                child : Text('${user.nome}', style: TextStyle(fontSize: 30),)
                ),
                Card(
                  child: ListTile(
                    title: Text("Telefone:"),
                    subtitle: Text('${user.telefone}'),
                    trailing: Container(
                      width: width/4,
                      child: Row(
                        children: [
                          IconButton(
                            color: Colors.blue,
                            icon: Icon(Icons.message),
                            onPressed: (){
                              launchApp('sms:${user.telefone}', context);
                            },
                          ),
                          IconButton(
                            color: Colors.blue,
                            icon: Icon(Icons.phone),
                            onPressed: (){
                              launchApp('tel:${user.telefone}', context);
                            }
                          )
                        ],
                      ),
                      ),
                    ),
                ),
                Card(
                  child: ListTile(
                    title: Text("E-mail:"),
                    onTap: (){
                      launchApp('mailto${user.email}', context);

                    },
                    subtitle: Text('${user.email}')
                    ),
                )
              ],
            )
            ,
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
import 'package:flutter/material.dart';
import 'package:sgs/features/reminder/presentation/pages/Users/user_form_back.dart';
import 'package:sgs/features/reminder/presentation/pages/Users/user_list.dart';

class LoginForm extends StatelessWidget {
  
  final _form = GlobalKey<FormState>();

  Widget fieldEmail(UserFormBack back){
    return TextFormField(
      validator: back.validateEmail,
      initialValue: back.user.email,
      decoration: InputDecoration(
        labelText: 'E-mail:'
        , hintText: 'email@email.com'
      ),
    );
  }

  Widget fieldSenha(UserFormBack back) {
    return TextFormField(
      validator: back.validateEmail,
      initialValue: back.user.senha,
      decoration:
          InputDecoration(labelText: 'Senha:'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = UserFormBack(context);
    return Scaffold(
      appBar: AppBar(title: Text('Faça seu Login'),
      actions:[
        IconButton(icon: Icon(Icons.lock_open), 
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => UserList()));
          }
        )
      ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fieldEmail(_back),
              fieldSenha(_back)
            ],) 
        ,),
      ),
    );
  }
}
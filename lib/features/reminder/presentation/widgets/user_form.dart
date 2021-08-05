import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sgs/features/reminder/presentation/pages/user_form_back.dart';


class UserForm extends StatelessWidget {
  
  final _form = GlobalKey<FormState>();

  Widget fieldName(UserFormBack back){
    return TextFormField(
      validator: back.validateName,
      onSaved: (newValue)=>back.user.nome = newValue,
      initialValue: back.user.nome,
      decoration: InputDecoration(
        labelText: 'Nome:'
      ),
    );
  }
  Widget fieldEmail(UserFormBack back){
    return TextFormField(
      validator: back.validateEmail,
      onSaved: (newValue) => back.user.email = newValue,
      initialValue: back.user.email,
      decoration: InputDecoration(
        labelText: 'E-mail:'
        , hintText: 'email@email.com'
      ),
    );
  }
  Widget fieldTelefone(UserFormBack back){
    var mask = MaskTextInputFormatter(mask:'(##)# ####-####');
    return TextFormField(
      validator: back.validatePhone,
      onSaved: (newValue) => back.user.telefone = newValue,
      initialValue: back.user.telefone,
      inputFormatters: [mask],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Telefone:',
        hintText: '(99)9 9999-9999'
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    var _back = UserFormBack(context);
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de contato'),
      actions:[
        IconButton(icon: Icon(Icons.save), 
        onPressed: (){
          _form.currentState.validate();
          _form.currentState.save();
          if(_back.isValid){
            _back.save();
            Navigator.of(context).pop();
          }
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
              fieldName(_back),
              fieldEmail(_back),
              fieldTelefone(_back),
            ],) 
        ,),
      ),
    );
  }
}
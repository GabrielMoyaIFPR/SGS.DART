import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class User extends Equatable {
   dynamic id;
   String nome;
   String email;
   String senha;
   String telefone;

  User(
      {@required this.id,
      @required this.nome,
      @required this.email,
      @required this.senha,
      @required this.telefone});
  @override
  List<Object> get props => [id, nome, email, senha, telefone];
}

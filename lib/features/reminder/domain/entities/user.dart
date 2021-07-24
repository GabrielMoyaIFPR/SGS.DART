import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class User extends Equatable {
 final int id;
  final String nome;
  final String email;
  final String senha;
  final String telefone;


  User(
    {
    @required this.id,
    @required this.nome,
    @required this.email,
    @required this.senha,
    @required this.telefone
    
    }
  );
  @override
  List<Object> get props => [id, nome, email, senha, telefone];
}
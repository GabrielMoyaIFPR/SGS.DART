import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sgs/features/reminder/domain/entities/user.dart';

class Sleep extends Equatable {
  dynamic id;
  DateTime dataInicial;
  DateTime dataFinal;
  User usuario;
  

  Sleep( 
      {@required this.id,
      @required this.dataInicial,
      @required this.dataFinal,
      @required this.usuario
  
  });
  
  
  @override
  List<Object> get props => [id, dataInicial, dataFinal, usuario];
}

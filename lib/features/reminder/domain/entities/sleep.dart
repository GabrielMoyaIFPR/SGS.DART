import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sgs/features/reminder/domain/entities/user.dart';

class Sleep extends Equatable {
  final int id;
  final DateTime dataInicial;
  final DateTime dataFinal;
  final User usuario;
  

  Sleep( 
      {@required this.id,
      @required this.dataInicial,
      @required this.dataFinal,
      @required this.usuario
  
  });
  
  
  @override
  List<Object> get props => [id, dataInicial, dataFinal, usuario];
}


import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Reminder extends Equatable {

  int id;
  String titulo;
  String descricao;


  Reminder(
    {
    @required this.id,
    @required this.descricao,
    @required this.titulo
    
    }
  );

  @override
  List<Object> get props => [id, titulo, descricao];
}
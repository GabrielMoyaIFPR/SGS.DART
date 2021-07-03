
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Reminder extends Equatable {

  final int id;
  final String titulo;
  final String descricao;


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
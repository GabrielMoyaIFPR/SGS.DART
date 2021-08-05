

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sgs/features/reminder/domain/entities/reminder.dart';
import 'package:sgs/features/reminder/domain/repositories/reminder_repository.dart';
import 'package:sgs/features/reminder/domain/usecases/get_reminder.dart';


class MockReminderRepository extends Mock implements ReminderRepository {}

void main(){
  GetReminder usecase;
  ReminderRepository repository;

  setUp(() {
    repository = MockReminderRepository();
    usecase = GetReminder(repository);
  });


  final tReminder = Reminder(
    id: 1, 
    descricao: 'teste', 
    titulo: 'testando'
  );
  

  test("Voltar uma mensagem pre-definida", () async{

    //arange
    when(repository.getReminder(any)).thenAnswer((_) async => tReminder);
    //acts
    final result = await usecase.execute(1);

    //asserts
    expect(result, tReminder);
    verify(repository.getReminder(1));
    verifyNoMoreInteractions(repository);

  });
}
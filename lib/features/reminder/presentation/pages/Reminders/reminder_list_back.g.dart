// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReminderListBack on _ReminderListBack, Store {
  final _$listAtom = Atom(name: '_ReminderListBack.list');

  @override
  Future<List<Reminder>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Reminder>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_ReminderListBackActionController =
      ActionController(name: '_ReminderListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_ReminderListBackActionController.startAction(
        name: '_ReminderListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_ReminderListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}

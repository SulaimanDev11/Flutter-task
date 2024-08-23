import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Params {}

class NoParams extends Params {}

class DateTimeParams extends Params {
  final DateTime dateTime;

  DateTimeParams({required this.dateTime});
}

class TimeParams extends Params {
  final TimeOfDay time;

  TimeParams({required this.time});
}

class ContextParams extends Params {
  final BuildContext context;

  ContextParams({required this.context});
}

class SaveUserParams extends Params {
  final String name;
  final DateTime checkInDateTime;
  final DateTime checkOutDateTime;
  final RxList<BreakTimeParams> breakTime;

  SaveUserParams({
    required this.name,
    required this.checkInDateTime,
    required this.checkOutDateTime,
    required this.breakTime,
  });
}

class BreakTimeParams extends Params {
  final DateTime start;
  final DateTime end;

  BreakTimeParams({
    required this.start,
    required this.end,
  });
}

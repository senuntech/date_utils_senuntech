import 'package:flutter/material.dart';

mixin DueDate {
  /// Retorna lista de datas com intervalos em meses, se o dia não estiver no mes atual retornará o ultimo dia do mês
  /// Exe: 2022-01-31 no mes de fevereiro ficará 2022-02-28 ou se for ano bissexto 2022-02-29.
  /// Se a data for 31 em meses que não há esse dia também retornará o ultimo dia.

  List<DateTime> month({
    required DateTime dueDate,
    required int interval,
    required int amountOfDate,
  }) {
    List<DateTime> listDate = [];
    DateTime dateTime = dueDate;

    for (var i = 0; i < amountOfDate; i++) {
      dateTime = DateUtils.addMonthsToMonthDate(dueDate, i * interval);
      int diasCorrenteMes = DateUtils.getDaysInMonth(
        dateTime.year,
        dateTime.month,
      );

      if (dateTime.month == 2 && dueDate.day >= 28) {
        dateTime = DateTime(
          dateTime.year,
          dateTime.month,
          28,
        );
      } else if (dueDate.day > diasCorrenteMes) {
        dateTime = DateTime(
          dateTime.year,
          dateTime.month,
          diasCorrenteMes,
        );
      } else {
        dateTime = DateTime(
          dateTime.year,
          dateTime.month,
          dueDate.day,
        );
      }
      listDate.add(dateTime);
    }

    return listDate;
  }

  /// Retorna lista de datas com intervalos em anos
  List<DateTime> year({
    required DateTime dueDate,
    required int interval,
    required int amountOfDate,
  }) {
    List<DateTime> listDate = [];
    DateTime dateTime = dueDate;
    listDate.add(dateTime);

    for (var i = 0; i < amountOfDate - 1; i++) {
      dateTime = DateTime(
        (dateTime.year + interval),
        dueDate.month,
        dueDate.day,
      );

      listDate.add(dateTime);
    }

    return listDate;
  }

  /// Retorna lista de datas com intervalos em semanas
  List<DateTime> week({
    required DateTime dueDate,
    required int interval,
    required int amountOfDate,
  }) {
    List<DateTime> listDate = [];
    DateTime dateTime = dueDate;
    listDate.add(dateTime);

    for (var i = 0; i < amountOfDate - 1; i++) {
      dateTime = dateTime.add(Duration(days: (7 * interval)));
      listDate.add(dateTime);
    }

    return listDate;
  }

  /// Retorna lista de datas com intervalos em dias
  List<DateTime> day({
    required DateTime dueDate,
    required int interval,
    required int amountOfDate,
  }) {
    List<DateTime> listDate = [];
    DateTime dateTime = dueDate;
    listDate.add(dateTime);

    for (var i = 0; i < amountOfDate - 1; i++) {
      dateTime = dateTime.add(Duration(days: interval));
      listDate.add(dateTime);
    }

    return listDate;
  }
}

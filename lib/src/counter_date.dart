import 'package:flutter/material.dart';

mixin CounterDate {
  /// Quantidade de mês até o final do corrente ano
  int couterMonth({
    /// Data de inicio
    required DateTime date,
  }) {
    DateTime dateStop = DateUtils.dateOnly(date);
    return (12 - dateStop.month);
  }

  /// Quantidade de semanas até o final do corrente ano
  int counterWeek({
    required DateTime date,
  }) {
    DateTime dateStop = DateUtils.dateOnly(date);
    int couterSemana = 0;

    while (dateStop.isBefore(DateTime(date.year, 12, 31))) {
      dateStop = dateStop.add(const Duration(days: 7));
      couterSemana++;
    }
    return (couterSemana - 1);
  }

  /// Quantidade de dias até o final do corrente ano
  int couterDay({
    required DateTime date,
  }) {
    DateTime dateStop = DateUtils.dateOnly(date);
    int couterDay = 0;

    while (dateStop.isBefore(DateTime(date.year, 12, 31))) {
      dateStop = dateStop.add(const Duration(days: 1));
      couterDay++;
    }
    return couterDay;
  }
}

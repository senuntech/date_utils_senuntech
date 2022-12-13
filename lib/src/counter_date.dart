mixin CounterDate {
  /// Quantidade de mês até o final do corrente ano
  int couterMonth({
    /// Data de inicio
    required DateTime date,
  }) {
    return (12 - date.month);
  }

  /// Quantidade de semanas até o final do corrente ano
  int counterWeek({
    required DateTime date,
  }) {
    DateTime dateStop = date;
    int couterSemana = 0;

    while (dateStop.isBefore(DateTime(2022, 12, 31))) {
      dateStop = dateStop.add(const Duration(days: 7));
      couterSemana++;
    }
    return (couterSemana - 1);
  }

  /// Quantidade de dias até o final do corrente ano
  int couterDay({
    required DateTime date,
  }) {
    DateTime dateStop = date;
    int couterDay = 0;

    while (dateStop != DateTime(2022, 12, 31)) {
      dateStop = dateStop.add(const Duration(days: 1));
      couterDay++;
    }
    return couterDay;
  }
}

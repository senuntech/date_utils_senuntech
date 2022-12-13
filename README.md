
# Utils Date Documentação

Adicionando dependência
```
date_utils_senuntech:
    git:
      url: https://github.com/senuntech/date_utils_senuntech.git
      ref: 1.0.0
```



Obter datas de vencimentos

```dart
listDates = DateUtilsSenuntech.mes(
                dueDate: DateTime(2022, 1, 5),
                interval: 1,
                amountOfDate: 10,
            );
```





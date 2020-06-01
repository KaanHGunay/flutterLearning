import 'package:flutter/material.dart';
import 'package:personal_tracer/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:personal_tracer/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double sumOfAmount = 0;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          sumOfAmount += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': sumOfAmount
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (previousValue, element) {
      return previousValue + element['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues.map((e) {
              return totalSpending == 0.0
                  ? SizedBox()
                  : Flexible(
                      // İçinde bulunduğu container a göre şekil almasını sağlar
                      fit: FlexFit.tight,
                      // Hiçbir element kendi bölgesinden daha büyük olamasın
                      // flex ile bulunulan bölgenin kaç x lik alanı kaplayacağı verilir
                      // Flexible ile fit tight kullanılacaksa Expanded classı da
                      // kullanılabilir
                      child: ChartBar(
                        e['day'],
                        e['amount'],
                        (e['amount'] as double) / totalSpending,
                      ),
                    );
            }).toList()),
      ),
    );
  }
}

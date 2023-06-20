import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '/features/admin/models/sales.dart';

class CategoryProductsChart extends StatelessWidget {
  final List<Sales> sales;

  const CategoryProductsChart({
    Key? key,
    required this.sales,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: sales
                .map((sale) => sale.earning)
                .reduce((value, element) => value > element ? value : element) *
            1.2,
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles:
                SideTitles(showTitles: true, getTitlesWidget: getBottomTitles),
          ),
        ),
        barGroups: sales
            .asMap()
            .map(
              (index, sale) => MapEntry(
                index,
                BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: sale.earning.toDouble(),
                      color: Colors.blue,
                      width: 16,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ],
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }

  Widget getBottomTitles(double value, TitleMeta) {
    // const style =
    //     TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14);

    //int index = value.toInt();
    // if (index >= 0 && index < sales.length) {
    //   return sales[index].label;
    // }
    var index = value.toInt() < sales.length ? sales[value.toInt()].label : "";
    return SideTitleWidget(axisSide: AxisSide.bottom, child: Text(index));
    // return SideTitleWidget(
    //   axisSide: AxisSide.bottom,
    //   child:  ,
    // );
  }
}

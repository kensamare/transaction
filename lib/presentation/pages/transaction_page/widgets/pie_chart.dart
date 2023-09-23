import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:transaction/utils/pj_colors.dart';

class PieChartTransaction extends StatelessWidget {
  final Map<String, double> dataMap;
  const PieChartTransaction({super.key, required this.dataMap});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 30.w,
      chartRadius: 300.r,
      colorList: [PjColors.green, PjColors.blue, PjColors.red],
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 40.r,
      centerText: "Транзакции",
      legendOptions: LegendOptions(
        showLegendsInRow: true,
        legendPosition: LegendPosition.bottom,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontSize: 15.w,
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: false,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 0,
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );
  }
}

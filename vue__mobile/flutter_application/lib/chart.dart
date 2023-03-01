// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api, avoid_print, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutChartExample extends StatefulWidget {
  const DoughnutChartExample({
    super.key,
  });

  @override
  _DoughnutChartExample createState() => _DoughnutChartExample();
}

class _DoughnutChartExample extends State<DoughnutChartExample> {
  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  late final List<GDPData> _chartData;
  late final TooltipBehavior _tooltipBehavior;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SfCircularChart(
          palette: const [
            Color.fromARGB(255, 150, 155, 216),
            Colors.pink,
          ],
          legend: Legend(
            isVisible: true,
            overflowMode: LegendItemOverflowMode.wrap,
            textStyle: const TextStyle(color: Colors.white),
          ),
          tooltipBehavior: _tooltipBehavior,
          series: <CircularSeries>[
            DoughnutSeries<GDPData, String>(
              dataSource: _chartData,
              xValueMapper: (GDPData data, _) => data.continent,
              yValueMapper: (GDPData data, _) => data.gdp,
              // dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true,
              animationDuration: 2000,
              animationDelay: 500,
              // maximumValue: 50,
            )
          ],
        ),
      ),
    );
  }

  getChartData() {
    final List<GDPData> chartData = [
      GDPData('Biens loués', 5),
      GDPData('Biens à louer', 10),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}

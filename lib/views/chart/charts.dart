import 'package:asthma_management/core/services/responsiveness.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample1 extends StatefulWidget {
  @override
  _LineChartSample1State createState() => _LineChartSample1State();
}

class _LineChartSample1State extends State<LineChartSample1> {
  List<Color> gradientColors = [Colors.transparent, Colors.transparent];

  bool showAvg = false;

  List<bool> buttons = [false, true, false, false, false];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.50,
          child: Container(
              height: 800,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: Colors.transparent,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: width,
                      height: McGyver.rsDoubleH(context, 12),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(65, 231, 23, 0.5),
                        border: Border.all(
                          width: 0.5,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    Container(
                      width: width,
                      height: McGyver.rsDoubleH(context, 5),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(225, 193, 68, 0.5),
                        border: Border.all(
                          width: 0.3,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    Container(
                      width: width,
                      height: McGyver.rsDoubleH(context, 10),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(239, 27, 27, 0.5),
                        border: Border.all(
                          width: 0.5,
                          color: Colors.black38,
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
        AspectRatio(
          aspectRatio: 1.50,
          child: Container(
            height: 800,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
              // color: Colors.transparent,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 0.0, top: 12, bottom: 2),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        drawHorizontalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.black12,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.black12,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 10),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'Mon';
              case 1:
                return 'Tues';
              case 2:
                return 'Wed';
              case 3:
                return 'Thurs';
              case 4:
                return 'Fri';
              case 5:
                return 'Sat';
              case 6:
                return 'Sun';
            }
            return '';
          },
          margin: 7,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '0';
              case 2:
                return '200';
              case 3:
                return '400';
              case 4:
                return '600';
              case 5:
                return '800';
            }
            return '';
          },
          reservedSize: 28,
          margin: 2,
        ),
      ),
      borderData: FlBorderData(
          show: false,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          colors: const [Colors.black],
          spots: [
            FlSpot(0, 3),
            FlSpot(1.6, 2),
            FlSpot(2.9, 5),
            FlSpot(3.8, 3.1),
            FlSpot(4, 4),
            FlSpot(5.5, 3),
            FlSpot(6, 4),
            // FlSpot(33, 3),
            // FlSpot(45.6, 2),
            // FlSpot(56.9, 5),
            // FlSpot(68.8, 3.1),
            // FlSpot(79, 4),
            // FlSpot(90.5, 3),
          ],
          isCurved: false,

          // gradientFrom: Offset.fromDirection(Direction),
          // colorStops: [30.2, 121.8],
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.2)).toList(),
          ),
        ),
      ],
    );
  }
}

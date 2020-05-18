import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/column/message_column_chart.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/column/message_column_chart_data.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/chart/column/message_column_chart_series.dart';
import 'package:fluttergoogleassistantclone/app/utils/color_utils.dart';
import 'package:fluttergoogleassistantclone/app/utils/string_utils.dart';
import 'package:fluttergoogleassistantclone/app/widgets/chart/formatter/label_value_formatter.dart';
import 'package:fluttergoogleassistantclone/app/widgets/chart/formatter/large_value_formatter.dart';
import 'package:mp_chart/mp/chart/bar_chart.dart';
import 'package:mp_chart/mp/controller/bar_chart_controller.dart';
import 'package:mp_chart/mp/core/data/bar_data.dart';
import 'package:mp_chart/mp/core/data_interfaces/i_bar_data_set.dart';
import 'package:mp_chart/mp/core/data_set/bar_data_set.dart';
import 'package:mp_chart/mp/core/entry/bar_entry.dart';
import 'package:mp_chart/mp/core/enums/x_axis_position.dart';

class ColumnChartWidget extends StatelessWidget {
  final MessageColumnChart chart;

  ColumnChartWidget(this.chart) {
    _initChart();
  }

  Widget _buildTitle() {
    if (StringUtils.isEmpty(chart.title)) {
      return Container();
    }

    return Text(chart.title);
  }

  Widget _buildSubtitle() {
    if (StringUtils.isEmpty(chart.subtitle)) {
      return Container();
    }

    return Container(
      padding: EdgeInsets.only(
        top: 4,
      ),
      child: Text(
        chart.subtitle,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildChart() {
    return Container(
      height: 250,
      child: BarChart(controller),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 4,
        ),
        child: Column(
          children: <Widget>[
            _buildTitle(),
            _buildSubtitle(),
            _buildChart(),
          ],
        ),
      ),
    );
  }

  final BarChartController controller = BarChartController(
    noDataText: "Não há dados suficientes para exibir o gráfico.",
    axisLeftSettingFunction: (axisLeft, controller) {
      axisLeft.setAxisMinimum(0);
      axisLeft.setValueFormatter(LargeValueFormatter());
    },
    axisRightSettingFunction: (axisRight, controller) {
      axisRight.enabled = false;
    },
  );

  void _initChart() {
    // Desabilita o zoom manual do gráfico
    controller.doubleTapToZoomEnabled = false;
    controller.pinchZoomEnabled = false;

    // Define um zoom fixo no gráfico para que seja criado um scroll horizontal
    controller.setScaleMinima(_getScaleX(), 1);

    // Desabilita uma opção que faz com que as escalas do gráfico fique atualizando seus
    // valores quando e realizado o scroll horizontal com base no tamanho da coluna
    controller.autoScaleMinMaxEnabled = false;

    // Carrega os valores do gráfico
    controller.data = BarData(_getDataSets());

    // Define a largura das barras com base no número de séries
    controller.data.barWidth = _getBarWidth();

    // Move os valores das colunas para o topo, por padrão vem centralizado de forma vertical
    controller.drawValueAboveBar = true;

    // Caso o gráfico tenha mais de uma série e feito o desagrupamento dos valores
    // para que não fiquem agrupados em uma única barra. Esse trecho de código só pode
    // ser chamado apos carregado os valores do gráfico
    if (_getSeriesSize() > 1) {
      controller.groupBars(0, _getGroupSpace(), _getBarSpace());
    }

    // Inicializa o eixo x para que seja possível passar algumas propriedades, caso
    // não seja feito e disparado um erro
    controller.xAxis = controller.initXAxis();

    // Desabilita as linhas do eixo x
    controller.xAxis.drawGridLines = false;

    // Define o valor inicial e final do eixo x. No caso do final e calculado com
    // base no número de séries
    controller.xAxis.setAxisMinValue(_getAxisMinValue());
    controller.xAxis.setAxisMaxValue(_getAxisMaxValue());

    // Altera a posição das labels do gráfico para parte de inferior, por padrão vem no topo
    controller.xAxis.position = XAxisPosition.BOTTOM;

    //
    controller.xAxis.setGranularity(_getGranularity());
    controller.xAxis.setValueFormatter(LabelValueFormatter(_getLabels(), _getSeriesSize()));
  }

  List<String> _getLabels() {
    return chart.series[0].data.map((data) => (data as MessageColumnChartData).label).toList();
  }

  List<IBarDataSet> _getDataSets() {
    List<IBarDataSet> dataSets = List<IBarDataSet>();

    for (int i = 0; i < chart.series.length; i++) {
      MessageColumnChartSeries series = chart.series[i];

      BarDataSet dataSet = BarDataSet(_getBarEntries(series), series.name);
      dataSet.setColor1(ColorUtils.defaultOrRandomColor(i));

      dataSets.add(dataSet);
    }

    return dataSets;
  }

  List<BarEntry> _getBarEntries(MessageColumnChartSeries chartSeries) {
    List<BarEntry> entries = List<BarEntry>();

    for (int i = 0; i < chartSeries.data.length; i++) {
      entries.add(BarEntry(x: i.toDouble(), y: (chartSeries.data[i] as MessageColumnChartData).value));
    }

    return entries;
  }

  int _getSeriesSize() => chart.series.length;

  int _getDataSize() => chart.series[0].data.length;

  double _getBarWidth() => _getSeriesSize() == 1 ? 0.9 : 20 / (23 * _getSeriesSize() + 8);

  double _getBarSpace() => 3 / (23 * _getSeriesSize() + 8);

  double _getGroupSpace() => 8 / (23 * _getSeriesSize() + 8);

  double _getScaleX() => _getSeriesSize() * chart.series[0].data.length / 5;

  double _getAxisMinValue() => _getSeriesSize() == 1 ? -0.6 : 0;

  double _getAxisMaxValue() {
    if (_getSeriesSize() == 1) {
      return controller.data.xMax + 0.6;
    }

    return (controller.data.getGroupWidth(_getGroupSpace(), _getBarSpace()) * _getDataSize()) + 0.6;
  }

  double _getGranularity() => _getSeriesSize() == 1 ? 1 : 0.5;
}

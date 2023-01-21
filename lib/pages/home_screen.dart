import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:provider/provider.dart';

import '../view_models/candles_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CandleData> candles = [];
  bool themeIsDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChangeNotifierProvider<CandleViewModel>(
            create: (context) => CandleViewModel()..fetchCandles(),
            builder: (context, child) {
              return Selector<CandleViewModel,List<CandleData>>(
                  selector: (context, model) => model.candles,
                  builder: (context, candles, child) {
                    return candles.isEmpty
                        ? const CircularProgressIndicator()
                        : InteractiveChart(
                      candles: candles,
                    );
                  }
              );
            }
        ),
      ),
    );
  }
}
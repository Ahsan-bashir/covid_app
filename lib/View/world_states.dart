import 'package:covid_app/Model/WorldStatesModel.dart';
import 'package:covid_app/Services/states_services.dart';
import 'package:covid_app/View/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:shimmer/shimmer.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({Key? key}) : super(key: key);

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[
     Colors.cyan,
     Colors.amberAccent,
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            FutureBuilder(
              future: statesServices.fetchWorldStatesRecord(),
              builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                if (snapshot.hasData) {
                  final worldStatesModel = snapshot.data;
                  if (worldStatesModel != null) {
                    if (worldStatesModel.recovered != null) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            PieChart(
                              dataMap: {
                                "Total": double.parse(
                                    worldStatesModel.cases.toString()),
                                "Recovered": double.parse(
                                    worldStatesModel.recovered.toString()),
                                "Death": double.parse(
                                    worldStatesModel.deaths.toString()),
                              },
                              chartValuesOptions: const ChartValuesOptions(
                                showChartValuesInPercentage: true,
                              ),
                              chartRadius:
                                  MediaQuery.of(context).size.width / 2.8,
                              legendOptions: const LegendOptions(
                                legendPosition: LegendPosition.left,
                              ),
                              animationDuration:
                                  const Duration(milliseconds: 1200),
                              chartType: ChartType.ring,
                              colorList: colorList,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.height * .06),
                              child: Card(
                                color: Colors.black45,
                                shadowColor: Colors.blueGrey,
                                child: Column(
                                  children: [
                                    ReusableRow(
                                        title: "Total",
                                        value:
                                            worldStatesModel.cases.toString()),
                                    ReusableRow(
                                        title: "Deaths",
                                        value:
                                            worldStatesModel.deaths.toString()),
                                    ReusableRow(
                                        title: "Recovered",
                                        value: worldStatesModel.recovered
                                            .toString()),
                                    ReusableRow(
                                        title: "Active",
                                        value:
                                            worldStatesModel.active.toString()),
                                    ReusableRow(
                                        title: "Critical",
                                        value: worldStatesModel.critical
                                            .toString()),
                                    ReusableRow(
                                        title: "Today Deaths",
                                        value: worldStatesModel.todayDeaths
                                            .toString()),
                                    ReusableRow(
                                        title: "Today Recovered",
                                        value: worldStatesModel.todayRecovered
                                            .toString()),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CountriesListScreen()));
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color:    Colors.amberAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                    child: Text("Track Countries",style: TextStyle(color: Colors.black),)),
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return const Text('Data is incomplete');
                    }
                  } else {
                    return const Text('Data is null');
                  }
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return    Shimmer.fromColors(
                      baseColor: Colors.grey.shade700,
                      highlightColor: Colors.grey.shade100,
                      child:const CircularProgressIndicator(
                        color: Colors.white24,
                      )
                    );

                } else {
                  return const Text('Unknown error occurred');
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title;
  final String value;

  const ReusableRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
        ],
      ),
    );
  }
}

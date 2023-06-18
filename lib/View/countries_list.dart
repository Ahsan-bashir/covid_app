import 'package:covid_app/Services/states_services.dart';
import 'package:covid_app/View/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              cursorColor: Colors.orangeAccent,
              controller: searchController,

              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  hintText: 'Search with Country Name',

                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(
                    50.0,
                  ),

                  )),
            ),
          ),
          Expanded(
              child: FutureBuilder(
            future: statesServices.countriesListApi(),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Data is still loading
                return ListView.builder(
                  itemCount: 10, // Placeholder item count
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade700,
                      highlightColor: Colors.grey.shade100,
                      child: Column(
                        children: [
                          ListTile(
                            title: Container(
                              height: 10,
                              width: 89,
                              color: Colors.white,
                            ),
                            subtitle: Container(
                              height: 10,
                              width: 89,
                              color: Colors.white,
                            ),
                            leading: Container(
                              height: 50,
                              width: 50,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasData) {
                // Data has been successfully fetched
                return Container(
                  height: 200, // Adjust the height as needed
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      String name = snapshot.data![index]['country'];

                      if (searchController.text.isEmpty) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                              image: snapshot.data![index]
                                                  ['countryInfo']['flag'],
                                              name: snapshot.data![index]
                                                  ['country'],
                                              totalCases: snapshot.data![index]
                                                  ['cases'],
                                              totalRecovered: snapshot
                                                  .data![index]['recovered'],
                                              totalDeaths: snapshot.data![index]
                                                  ['deaths'],
                                              active: snapshot.data![index]
                                                  ['active'],
                                              test: snapshot.data![index]
                                                  ['tests'],
                                              todayRecovered:
                                                  snapshot.data![index]
                                                      ['todayRecovered'],
                                              critical: snapshot.data![index]
                                                  ['critical'],
                                            )));
                              },
                              child: ListTile(
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(
                                    snapshot.data![index]['cases'].toString()),
                                leading: Image.network(
                                  snapshot.data![index]['countryInfo']['flag'],
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else if (name
                          .toLowerCase()
                          .contains(searchController.text.toLowerCase())) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                              image: snapshot.data![index]
                                                  ['countryInfo']['flag'],
                                              name: snapshot.data![index]
                                                  ['country'],
                                              totalCases: snapshot.data![index]
                                                  ['cases'],
                                              totalRecovered: snapshot
                                                  .data![index]['recovered'],
                                              totalDeaths: snapshot.data![index]
                                                  ['deaths'],
                                              active: snapshot.data![index]
                                                  ['active'],
                                              test: snapshot.data![index]
                                                  ['tests'],
                                              todayRecovered:
                                                  snapshot.data![index]
                                                      ['todayRecovered'],
                                              critical: snapshot.data![index]
                                                  ['critical'],
                                            )));
                              },
                              child: ListTile(
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(
                                    snapshot.data![index]['cases'].toString()),
                                leading: Image.network(
                                  snapshot.data![index]['countryInfo']['flag'],
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                );
              } else {
                // Data is null or an error occurred
                return Text('No data available');
              }
            },
          ))
        ],
      )),
    );
  }
}

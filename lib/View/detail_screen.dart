import 'package:covid_app/View/world_states.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String name,image;
  int totalCases,totalDeaths,totalRecovered,active,critical,todayRecovered,test;
   DetailScreen({
     Key? key,
     required this.image,
     required this.name,
     required this.totalCases,
     required this.totalDeaths,
     required this.totalRecovered,
     required this.active,
     required this.critical,
     required this.todayRecovered,
     required this.test,


   }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: Text(widget.name),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*.067),
                child: Card(

                  color: Colors.black45,
                  shadowColor: Colors.blueGrey,
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*.06,),
                      ReusableRow(title: "Cases", value: widget.totalCases.toString()),
                      ReusableRow(title: "Active", value: widget.active.toString()),
                      ReusableRow(title: "Recovered", value: widget.totalRecovered.toString()),
                      ReusableRow(title: "Deaths", value: widget.totalDeaths.toString()),
                      ReusableRow(title: "Critical", value: widget.critical.toString()),
                      ReusableRow(title: "Today Recovered", value: widget.totalRecovered.toString()),

                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}

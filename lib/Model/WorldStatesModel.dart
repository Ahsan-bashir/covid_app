class WorldStatesModel {
  WorldStatesModel({
    required this.updated,
    required this.cases,
    required this.todayCases,
    required this.deaths,
    required this.todayDeaths,
    required this.recovered,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.casesPerOneMillion,
    required this.deathsPerOneMillion,
    required this.tests,
    required this.testsPerOneMillion,
    required this.population,
    required this.oneCasePerPeople,
    required this.oneDeathPerPeople,
    required this.oneTestPerPeople,
    required this.activePerOneMillion,
    required this.recoveredPerOneMillion,
    required this.criticalPerOneMillion,
    required this.affectedCountries,
  });

  factory WorldStatesModel.fromJson(Map<String, dynamic> json) {
    return WorldStatesModel(
      updated: json['updated'] ?? 0,
      cases: json['cases'] ?? 0,
      todayCases: json['todayCases'] ?? 0,
      deaths: json['deaths'] ?? 0,
      todayDeaths: json['todayDeaths'] ?? 0,
      recovered: json['recovered'] ?? 0,
      todayRecovered: json['todayRecovered'] ?? 0,
      active: json['active'] ?? 0,
      critical: json['critical'] ?? 0,
      casesPerOneMillion: json['casesPerOneMillion'] ?? 0,
      deathsPerOneMillion: (json['deathsPerOneMillion'] ?? 0.0).toDouble(),
      tests: json['tests'] ?? 0,
      testsPerOneMillion: (json['testsPerOneMillion'] ?? 0.0).toDouble(),
      population: json['population'] ?? 0,
      oneCasePerPeople: json['oneCasePerPeople'] ?? 0,
      oneDeathPerPeople: json['oneDeathPerPeople'] ?? 0,
      oneTestPerPeople: json['oneTestPerPeople'] ?? 0,
      activePerOneMillion: (json['activePerOneMillion'] ?? 0.0).toDouble(),
      recoveredPerOneMillion: (json['recoveredPerOneMillion'] ?? 0.0).toDouble(),
      criticalPerOneMillion: (json['criticalPerOneMillion'] ?? 0.0).toDouble(),
      affectedCountries: json['affectedCountries'] ?? 0,
    );
  }


  int updated;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int todayRecovered;
  int active;
  int critical;
  int casesPerOneMillion;
  double deathsPerOneMillion;
  int tests;
  double testsPerOneMillion;
  int population;
  int oneCasePerPeople;
  int oneDeathPerPeople;
  int oneTestPerPeople;
  double activePerOneMillion;
  double recoveredPerOneMillion;
  double criticalPerOneMillion;
  int affectedCountries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['updated'] = updated;
    map['cases'] = cases;
    map['todayCases'] = todayCases;
    map['deaths'] = deaths;
    map['todayDeaths'] = todayDeaths;
    map['recovered'] = recovered;
    map['todayRecovered'] = todayRecovered;
    map['active'] = active;
    map['critical'] = critical;
    map['casesPerOneMillion'] = casesPerOneMillion;
    map['deathsPerOneMillion'] = deathsPerOneMillion;
    map['tests'] = tests;
    map['testsPerOneMillion'] = testsPerOneMillion;
    map['population'] = population;
    map['oneCasePerPeople'] = oneCasePerPeople;
    map['oneDeathPerPeople'] = oneDeathPerPeople;
    map['oneTestPerPeople'] = oneTestPerPeople;
    map['activePerOneMillion'] = activePerOneMillion;
    map['recoveredPerOneMillion'] = recoveredPerOneMillion;
    map['criticalPerOneMillion'] = criticalPerOneMillion;
    map['affectedCountries'] = affectedCountries;
    return map;
  }
}

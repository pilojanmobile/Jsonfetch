class Country{
  String update_date_time;
  int local_new_cases;
  int local_deaths;
  int local_recovered;
  Country({this.update_date_time,this.local_new_cases,this.local_deaths,this.local_recovered});


  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      update_date_time: json['data']['update_date_time'] as String,
      local_new_cases: json['data']['local_new_cases'] as int,
      local_deaths: json['data']['local_deaths'] as int,
      local_recovered: json['data']['local_recovered'] as int,
    );
  }
}
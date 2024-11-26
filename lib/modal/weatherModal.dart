class Weather {
  late Location locationModal;
  late Current currentModal;
  late Forcat forcatModal;

  Weather(this.locationModal, this.currentModal, this.forcatModal);

  factory Weather.fromJson(Map m1) {
    return Weather(
        Location.fromJson(m1['location']),
        Current.fromJson(m1['current']),
        Forcat.fromJson(m1['forecast']));
  }


}

class Location {
  late String name, region, country, localtime;

  Location(this.name, this.region, this.country, this.localtime);

  factory Location.fromJson(Map m1) {
    return Location(
        m1['name'], m1['region'], m1['country'], m1['localtime']);
  }
}

class Current {
  late double temp_c, temp_f, wind_mph, wind_kph, pressure_in, pressure_mb, uv;
  late int is_day, humidity, cloud;
  late Condition condition;

  Current(
      this.temp_c,
      this.temp_f,
      this.wind_mph,
      this.wind_kph,
      this.pressure_in,
      this.uv,
      this.is_day,
      this.humidity,
      this.cloud,
      this.pressure_mb,
      this.condition);

  factory Current.fromJson(Map m1) {
    return Current(
        m1['temp_c'].toDouble(),
        m1['temp_f'].toDouble(),
        m1['wind_mph'].toDouble(),
        m1['wind_kph'].toDouble(),
        m1['pressure_in'].toDouble(),
        m1['uv'].toDouble(),
        m1['is_day'],
        m1['humidity'],
        m1['cloud'],
        m1['pressure_mb'].toDouble(),
        Condition.fromJson(m1['condition']));
  }
}

class Condition {
  late String text, icon;

  Condition(this.text, this.icon);

  factory Condition.fromJson(Map m1) {
    return Condition(m1['text'], m1['icon']);
  }
}

class Forcat {
  late List<Forecastday> forcastday = [];

  Forcat(this.forcastday);

  factory Forcat.fromJson(Map m1) {
    return Forcat((m1['forecastday'] as List)
        .map(
          (e) => Forecastday.fromJson(e),
    )
        .toList() ?? []);
  }
}

class Forecastday {
  late String date;
  late Day day;
  late Astro astro;
  late List<Hour> hour = [];

  Forecastday(this.date, this.day, this.hour,this.astro);

  factory Forecastday.fromJson(Map m1) {
    return Forecastday(
      m1['date'],
      Day.fromJson(m1['day']),
      (m1['hour'] as List)
          .map(
            (e) => Hour.fromJson(e),
      )
          .toList(),
      Astro.fromJson(m1['astro']),
    );
  }
}

class Astro
{
  late String sunrise,sunset;

  Astro(this.sunrise,this.sunset);

  factory Astro.fromJson(Map m1)
  {
    return Astro(m1['sunrise'], m1['sunset']);
  }
}

class Day {
  late double maxtemp_c, mintemp_c;
  late DayConditionModal dayConditionModal;
  late int daily_chance_of_rain;

  Day(this.maxtemp_c, this.mintemp_c, this.dayConditionModal,this.daily_chance_of_rain);

  factory Day.fromJson(Map m1) {
    return Day(m1['maxtemp_c'].toDouble(), m1['mintemp_c'].toDouble(),
        DayConditionModal.fromJson(m1['condition']),m1['daily_chance_of_rain']);
  }
}

class DayConditionModal {
  late String text, icon;

  DayConditionModal(this.text, this.icon);

  factory DayConditionModal.fromJson(Map m1) {
    return DayConditionModal(m1['text'], m1['icon']);
  }
}

class Hour {
  late String time;
  late double temp_c;
  late int is_day;
  late HourConditionModal hourConditionModal;

  Hour(this.time, this.temp_c, this.is_day, this.hourConditionModal);

  factory Hour.fromJson(Map m1) {
    return Hour(m1['time'], m1['temp_c'].toDouble(), m1['is_day'],
        HourConditionModal.fromJson(m1['condition']));
  }
}

class HourConditionModal {
  late String text, icon;

  HourConditionModal(this.text, this.icon);

  factory HourConditionModal.fromJson(Map m1) {
    return HourConditionModal(m1['text'], m1['icon']);
  }
}
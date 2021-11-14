/// 长春天气数据
class Weather {
  Weather({
    required this.city,
    required this.updatetime,
    required this.wendu,
    required this.fengli,
    required this.shidu,
    required this.fengxiang,
    required this.sunrise,
    required this.sunset,
    required this.yesterday,
    required this.forecast,
    required this.zhishus,
  });

  /// 城市
  late final String city;

  /// 更新时间
  late final String updatetime;

  /// 温度
  late final String wendu;

  /// 风力
  late final String fengli;

  /// 湿度
  late final String shidu;

  /// 风向
  late final String fengxiang;

  /// 日出时间
  late final String sunrise;

  /// 日落时间
  late final String sunset;

  /// 昨天天气
  late final Yesterday yesterday;

  /// 预报天气
  late final Forecast forecast;

  /// 生活指数
  late final ZhishuList zhishus;

  Weather.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    updatetime = json['updatetime'];
    wendu = json['wendu'];
    fengli = json['fengli'];
    shidu = json['shidu'];
    fengxiang = json['fengxiang'];
    sunrise = json['sunrise_1'];
    sunset = json['sunset_1'];
    yesterday = Yesterday.fromJson(json['yesterday']);
    forecast = Forecast.fromJson(json['forecast']);
    zhishus = ZhishuList.fromJson(json['zhishus']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['city'] = city;
    _data['updatetime'] = updatetime;
    _data['wendu'] = wendu;
    _data['fengli'] = fengli;
    _data['shidu'] = shidu;
    _data['fengxiang'] = fengxiang;
    _data['sunrise_1'] = sunrise;
    _data['sunset_1'] = sunset;
    _data['yesterday'] = yesterday.toJson();
    _data['forecast'] = forecast.toJson();
    _data['zhishus'] = zhishus.toJson();
    return _data;
  }
}

/// 昨天天气数据
class Yesterday {
  Yesterday({
    required this.date,
    required this.high,
    required this.low,
    required this.day,
    required this.night,
  });

  /// 日期
  late final String date;

  /// 最高温度
  late final String high;

  /// 最低温度
  late final String low;

  /// 白天天气
  late final DayData day;

  /// 晚上天气
  late final NightData night;

  Yesterday.fromJson(Map<String, dynamic> json) {
    date = json['date_1'];
    high = json['high_1'];
    low = json['low_1'];
    day = DayData.fromJson(json['day_1']);
    night = NightData.fromJson(json['night_1']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['date_1'] = date;
    _data['high_1'] = high;
    _data['low_1'] = low;
    _data['day_1'] = day.toJson();
    _data['night_1'] = night.toJson();
    return _data;
  }
}

/// 日间天气数据
class DayData {
  DayData({
    required this.type_1,
    required this.fx_1,
    required this.fl_1,
  });
  late final String type_1;
  late final String fx_1;
  late final String fl_1;

  DayData.fromJson(Map<String, dynamic> json) {
    type_1 = json['type_1'];
    fx_1 = json['fx_1'];
    fl_1 = json['fl_1'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type_1'] = type_1;
    _data['fx_1'] = fx_1;
    _data['fl_1'] = fl_1;
    return _data;
  }
}

/// 夜间天气数据
class NightData {
  NightData({
    required this.type,
    required this.fx,
    required this.fl,
  });

  /// 天气类型, 例如: 多云
  late final String type;

  /// 风向
  late final String fx;

  /// 风力
  late final String fl;

  NightData.fromJson(Map<String, dynamic> json) {
    type = json['type_1'];
    fx = json['fx_1'];
    fl = json['fl_1'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type_1'] = type;
    _data['fx_1'] = fx;
    _data['fl_1'] = fl;
    return _data;
  }
}

/// 5日预报天气数据
class Forecast {
  Forecast({
    required this.weather,
  });

  late final List<WeatherForecast> weather;

  Forecast.fromJson(Map<String, dynamic> json) {
    weather = List.from(json['weather'])
        .map((e) => WeatherForecast.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['weather'] = weather.map((e) => e.toJson()).toList();
    return _data;
  }
}

class WeatherForecast {
  WeatherForecast({
    required this.date,
    required this.high,
    required this.low,
    required this.day,
    required this.night,
  });

  /// 日期
  late final String date;

  /// 最高温度
  late final String high;

  /// 最低温度
  late final String low;

  /// 白天天气
  late final DayForecast day;

  /// 晚上天气
  late final NightForecast night;

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    high = json['high'];
    low = json['low'];
    day = DayForecast.fromJson(json['day']);
    night = NightForecast.fromJson(json['night']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['date'] = date;
    _data['high'] = high;
    _data['low'] = low;
    _data['day'] = day.toJson();
    _data['night'] = night.toJson();
    return _data;
  }
}

/// 白天天气预报数据
class DayForecast {
  DayForecast({
    required this.type,
    required this.fengxiang,
    required this.fengli,
  });

  /// 天气类型, 例如: 多云
  late final String type;

  /// 风向
  late final String fengxiang;

  /// 风力
  late final String fengli;

  DayForecast.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    fengxiang = json['fengxiang'];
    fengli = json['fengli'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['fengxiang'] = fengxiang;
    _data['fengli'] = fengli;
    return _data;
  }
}

/// 晚上天气预报数据
class NightForecast {
  NightForecast({
    required this.type,
    required this.fengxiang,
    required this.fengli,
  });

  /// 天气类型, 例如: 多云
  late final String type;

  /// 风向
  late final String fengxiang;

  /// 风力
  late final String fengli;

  NightForecast.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    fengxiang = json['fengxiang'];
    fengli = json['fengli'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['fengxiang'] = fengxiang;
    _data['fengli'] = fengli;
    return _data;
  }
}

/// 生活指数
class ZhishuList {
  ZhishuList({
    required this.zhishu,
  });

  late final List<Zhishu> zhishu;

  ZhishuList.fromJson(Map<String, dynamic> json) {
    zhishu = List.from(json['zhishu']).map((e) => Zhishu.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['zhishu'] = zhishu.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Zhishu {
  Zhishu({
    required this.name,
    required this.value,
    required this.detail,
  });

  /// 指数名称, 例如: 紫外线指数
  late final String name;

  /// 指数值, 例如: 最弱
  late final String value;

  /// 指数详情, 例如: 紫外线强度较弱，建议出门前涂擦SPF在12-15之间、PA+的防晒护肤品
  late final String detail;

  Zhishu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['value'] = value;
    _data['detail'] = detail;
    return _data;
  }
}

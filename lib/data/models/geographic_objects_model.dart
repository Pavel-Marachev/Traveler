/// type : "FeatureCollection"
/// properties : {"ResponseMetaData":{"SearchResponse":{"found":10,"display":"single","boundedBy":[[31.998377,54.696756],[32.031372,54.714152]]},"SearchRequest":{"request":"Рай,Россия","skip":0,"results":10,"boundedBy":[[37.048427,55.43644866],[38.175903,56.04690174]]}}}
/// features : [{"type":"Feature","geometry":{"type":"Point","coordinates":[32.016406,54.705044]},"properties":{"name":"деревня Рай","description":"Смоленский район, Россия","boundedBy":[[31.998377,54.696756],[32.031372,54.714152]],"GeocoderMetaData":{"precision":"other","text":"Россия, Смоленский район, деревня Рай","kind":"locality"}}},{"type":"Feature","geometry":{"type":"Point","coordinates":[31.819953,68.574668]},"properties":{"name":"река Рай","description":"городское поселение Верхнетуломский, Кольский район, Мурманская область, Россия","boundedBy":[[31.807584,68.557967],[31.837947,68.597722]],"GeocoderMetaData":{"precision":"other","text":"Россия, Мурманская область, Кольский район, городское поселение Верхнетуломский, река Рай","kind":"hydro"}}},{"type":"Feature","geometry":{"type":"Point","coordinates":[143.518227,60.762699]},"properties":{"name":"река Рай","description":"Охотский район, Хабаровский край, Россия","boundedBy":[[143.488188,60.73072],[143.547189,60.776187]],"GeocoderMetaData":{"precision":"other","text":"Россия, Хабаровский край, Охотский район, река Рай","kind":"hydro"}}},{"type":"Feature","geometry":{"type":"Point","coordinates":[50.002286,61.053777]},"properties":{"name":"деревня Рай","description":"муниципальное образование Визинга, муниципальный район Сысольский, Республика Коми, Россия","boundedBy":[[49.986044,61.051138],[50.015365,61.058197]],"GeocoderMetaData":{"precision":"other","text":"Россия, Республика Коми, муниципальный район Сысольский, муниципальное образование Визинга, деревня Рай","kind":"locality"}}},{"type":"Feature","geometry":{"type":"Point","coordinates":[65.323098,66.901625]},"properties":{"name":"горный массив Рай-Из","description":"Россия","boundedBy":[[64.973941,66.782237],[65.740904,67.000011]],"GeocoderMetaData":{"precision":"other","text":"Россия, горный массив Рай-Из","kind":"other"}}},{"type":"Feature","geometry":{"type":"Point","coordinates":[143.623079,60.246188]},"properties":{"name":"река Рай","description":"Охотский район, Хабаровский край, Россия","boundedBy":[[143.614473,60.241231],[143.632269,60.249484]],"GeocoderMetaData":{"precision":"other","text":"Россия, Хабаровский край, Охотский район, река Рай","kind":"hydro"}}},{"type":"Feature","geometry":{"type":"Point","coordinates":[46.793135,59.034302]},"properties":{"name":"деревня Рай","description":"Вохомский район, Костромская область, Россия","boundedBy":[[46.787332,59.032079],[46.798885,59.041529]],"GeocoderMetaData":{"precision":"other","text":"Россия, Костромская область, Вохомский район, деревня Рай","kind":"locality"}}},{"type":"Feature","geometry":{"type":"Point","coordinates":[36.90758,62.052959]},"properties":{"name":"озеро Рай","description":"Кубовское сельское поселение, Пудожский район, Республика Карелия, Россия","boundedBy":[[36.900798,62.050311],[36.914668,62.055425]],"GeocoderMetaData":{"precision":"other","text":"Россия, Республика Карелия, Пудожский район, Кубовское сельское поселение, озеро Рай","kind":"hydro"}}},{"type":"Feature","geometry":{"type":"Point","coordinates":[36.293078,57.573919]},"properties":{"name":"деревня Раи","description":"Бежецкий район, Тверская область, Россия","boundedBy":[[36.288254,57.571043],[36.297579,57.576221]],"GeocoderMetaData":{"precision":"other","text":"Россия, Тверская область, Бежецкий район, деревня Раи","kind":"locality"}}},{"type":"Feature","geometry":{"type":"Point","coordinates":[37.860998,50.386509]},"properties":{"name":"поселок Рай","description":"Волоконовский район, Белгородская область, Россия","boundedBy":[[37.858815,50.384728],[37.863783,50.388117]],"GeocoderMetaData":{"precision":"other","text":"Россия, Белгородская область, Волоконовский район, поселок Рай","kind":"locality"}}}]

class GeographicObjectsModel {
  GeographicObjectsModel({
    String? type,
    Properties? properties,
    List<Features>? features,
  }) {
    _type = type;
    _properties = properties;
    _features = features;
  }

  GeographicObjectsModel.fromJson(dynamic json) {
    _type = json['type'];
    _properties = json['properties'] != null
        ? Properties.fromJson(json['properties'])
        : null;
    if (json['features'] != null) {
      _features = [];
      json['features'].forEach((v) {
        _features?.add(Features.fromJson(v));
      });
    }
  }
  String? _type;
  Properties? _properties;
  List<Features>? _features;
  GeographicObjectsModel copyWith({
    String? type,
    Properties? properties,
    List<Features>? features,
  }) =>
      GeographicObjectsModel(
        type: type ?? _type,
        properties: properties ?? _properties,
        features: features ?? _features,
      );
  String? get type => _type;
  Properties? get properties => _properties;
  List<Features>? get features => _features;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    if (_properties != null) {
      map['properties'] = _properties?.toJson();
    }
    if (_features != null) {
      map['features'] = _features?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// type : "Feature"
/// geometry : {"type":"Point","coordinates":[32.016406,54.705044]}
/// properties : {"name":"деревня Рай","description":"Смоленский район, Россия","boundedBy":[[31.998377,54.696756],[32.031372,54.714152]],"GeocoderMetaData":{"precision":"other","text":"Россия, Смоленский район, деревня Рай","kind":"locality"}}

class Features {
  Features({
    String? type,
    Geometry? geometry,
    Properties? properties,
  }) {
    _type = type;
    _geometry = geometry;
    _properties = properties;
  }

  Features.fromJson(dynamic json) {
    _type = json['type'];
    _geometry =
        json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    _properties = json['properties'] != null
        ? Properties.fromJson(json['properties'])
        : null;
  }
  String? _type;
  Geometry? _geometry;
  Properties? _properties;
  Features copyWith({
    String? type,
    Geometry? geometry,
    Properties? properties,
  }) =>
      Features(
        type: type ?? _type,
        geometry: geometry ?? _geometry,
        properties: properties ?? _properties,
      );
  String? get type => _type;
  Geometry? get geometry => _geometry;
  Properties? get properties => _properties;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    if (_geometry != null) {
      map['geometry'] = _geometry?.toJson();
    }
    if (_properties != null) {
      map['properties'] = _properties?.toJson();
    }
    return map;
  }
}

/// name : "деревня Рай"
/// description : "Смоленский район, Россия"
/// boundedBy : [[31.998377,54.696756],[32.031372,54.714152]]
/// GeocoderMetaData : {"precision":"other","text":"Россия, Смоленский район, деревня Рай","kind":"locality"}

class Properties {
  Properties({
    String? name,
    String? description,
    List<List<double>>? boundedBy,
    GeocoderMetaData? geocoderMetaData,
    ResponseMetaData? responseMetaData,
  }) {
    _name = name;
    _description = description;
    _boundedBy = boundedBy;
    _geocoderMetaData = geocoderMetaData;
  }

  Properties.fromJson(dynamic json) {
    _name = json['name'];
    _description = json['description'];
    _boundedBy =
        json['boundedBy'] != null ? json['boundedBy'].cast<double>() : [];
    _geocoderMetaData = json['GeocoderMetaData'] != null
        ? GeocoderMetaData.fromJson(json['GeocoderMetaData'])
        : null;
  }
  String? _name;
  String? _description;
  List<List<double>>? _boundedBy;
  GeocoderMetaData? _geocoderMetaData;
  Properties copyWith({
    String? name,
    String? description,
    List<List<double>>? boundedBy,
    GeocoderMetaData? geocoderMetaData,
  }) =>
      Properties(
        name: name ?? _name,
        description: description ?? _description,
        boundedBy: boundedBy ?? _boundedBy,
        geocoderMetaData: geocoderMetaData ?? _geocoderMetaData,
      );
  String? get name => _name;
  String? get description => _description;
  List<List<double>>? get boundedBy => _boundedBy;
  GeocoderMetaData? get geocoderMetaData => _geocoderMetaData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['description'] = _description;
    map['boundedBy'] = _boundedBy;
    if (_geocoderMetaData != null) {
      map['GeocoderMetaData'] = _geocoderMetaData?.toJson();
    }
    return map;
  }
}

/// precision : "other"
/// text : "Россия, Смоленский район, деревня Рай"
/// kind : "locality"

class GeocoderMetaData {
  GeocoderMetaData({
    String? precision,
    String? text,
    String? kind,
  }) {
    _precision = precision;
    _text = text;
    _kind = kind;
  }

  GeocoderMetaData.fromJson(dynamic json) {
    _precision = json['precision'];
    _text = json['text'];
    _kind = json['kind'];
  }
  String? _precision;
  String? _text;
  String? _kind;
  GeocoderMetaData copyWith({
    String? precision,
    String? text,
    String? kind,
  }) =>
      GeocoderMetaData(
        precision: precision ?? _precision,
        text: text ?? _text,
        kind: kind ?? _kind,
      );
  String? get precision => _precision;
  String? get text => _text;
  String? get kind => _kind;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['precision'] = _precision;
    map['text'] = _text;
    map['kind'] = _kind;
    return map;
  }
}

/// type : "Point"
/// coordinates : [32.016406,54.705044]

class Geometry {
  Geometry({
    String? type,
    List<double>? coordinates,
  }) {
    _type = type;
    _coordinates = coordinates;
  }

  Geometry.fromJson(dynamic json) {
    _type = json['type'];
    _coordinates =
        json['coordinates'] != null ? json['coordinates'].cast<double>() : [];
  }
  String? _type;
  List<double>? _coordinates;
  Geometry copyWith({
    String? type,
    List<double>? coordinates,
  }) =>
      Geometry(
        type: type ?? _type,
        coordinates: coordinates ?? _coordinates,
      );
  String? get type => _type;
  List<double>? get coordinates => _coordinates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['coordinates'] = _coordinates;
    return map;
  }
}

/// ResponseMetaData : {"SearchResponse":{"found":10,"display":"single","boundedBy":[[31.998377,54.696756],[32.031372,54.714152]]},"SearchRequest":{"request":"Рай,Россия","skip":0,"results":10,"boundedBy":[[37.048427,55.43644866],[38.175903,56.04690174]]}}

class Properties1 {
  Properties1({
    ResponseMetaData? responseMetaData,
  }) {
    _responseMetaData = responseMetaData;
  }

  Properties1.fromJson(dynamic json) {
    _responseMetaData = json['ResponseMetaData'] != null
        ? ResponseMetaData.fromJson(json['ResponseMetaData'])
        : null;
  }
  ResponseMetaData? _responseMetaData;
  Properties1 copyWith({
    ResponseMetaData? responseMetaData,
  }) =>
      Properties1(
        responseMetaData: responseMetaData ?? _responseMetaData,
      );
  ResponseMetaData? get responseMetaData => _responseMetaData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_responseMetaData != null) {
      map['ResponseMetaData'] = _responseMetaData?.toJson();
    }
    return map;
  }
}

/// SearchResponse : {"found":10,"display":"single","boundedBy":[[31.998377,54.696756],[32.031372,54.714152]]}
/// SearchRequest : {"request":"Рай,Россия","skip":0,"results":10,"boundedBy":[[37.048427,55.43644866],[38.175903,56.04690174]]}

class ResponseMetaData {
  ResponseMetaData({
    SearchResponse? searchResponse,
    SearchRequest? searchRequest,
  }) {
    _searchResponse = searchResponse;
    _searchRequest = searchRequest;
  }

  ResponseMetaData.fromJson(dynamic json) {
    _searchResponse = json['SearchResponse'] != null
        ? SearchResponse.fromJson(json['SearchResponse'])
        : null;
    _searchRequest = json['SearchRequest'] != null
        ? SearchRequest.fromJson(json['SearchRequest'])
        : null;
  }
  SearchResponse? _searchResponse;
  SearchRequest? _searchRequest;
  ResponseMetaData copyWith({
    SearchResponse? searchResponse,
    SearchRequest? searchRequest,
  }) =>
      ResponseMetaData(
        searchResponse: searchResponse ?? _searchResponse,
        searchRequest: searchRequest ?? _searchRequest,
      );
  SearchResponse? get searchResponse => _searchResponse;
  SearchRequest? get searchRequest => _searchRequest;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_searchResponse != null) {
      map['SearchResponse'] = _searchResponse?.toJson();
    }
    if (_searchRequest != null) {
      map['SearchRequest'] = _searchRequest?.toJson();
    }
    return map;
  }
}

/// request : "Рай,Россия"
/// skip : 0
/// results : 10
/// boundedBy : [[37.048427,55.43644866],[38.175903,56.04690174]]

class SearchRequest {
  SearchRequest({
    String? request,
    int? skip,
    int? results,
    List<List<double>>? boundedBy,
  }) {
    _request = request;
    _skip = skip;
    _results = results;
    _boundedBy = boundedBy;
  }

  SearchRequest.fromJson(dynamic json) {
    _request = json['request'];
    _skip = json['skip'];
    _results = json['results'];
    _boundedBy =
        json['boundedBy'] != null ? json['boundedBy'].cast<double>() : [];
  }
  String? _request;
  int? _skip;
  int? _results;
  List<List<double>>? _boundedBy;
  SearchRequest copyWith({
    String? request,
    int? skip,
    int? results,
    List<List<double>>? boundedBy,
  }) =>
      SearchRequest(
        request: request ?? _request,
        skip: skip ?? _skip,
        results: results ?? _results,
        boundedBy: boundedBy ?? _boundedBy,
      );
  String? get request => _request;
  int? get skip => _skip;
  int? get results => _results;
  List<List<double>>? get boundedBy => _boundedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['request'] = _request;
    map['skip'] = _skip;
    map['results'] = _results;
    map['boundedBy'] = _boundedBy;
    return map;
  }
}

/// found : 10
/// display : "single"
/// boundedBy : [[31.998377,54.696756],[32.031372,54.714152]]

class SearchResponse {
  SearchResponse({
    int? found,
    String? display,
    List<List<double>>? boundedBy,
  }) {
    _found = found;
    _display = display;
    _boundedBy = boundedBy;
  }

  SearchResponse.fromJson(dynamic json) {
    _found = json['found'];
    _display = json['display'];
    _boundedBy =
        json['boundedBy'] != null ? json['boundedBy'].cast<double>() : [];
  }
  int? _found;
  String? _display;
  List<List<double>>? _boundedBy;
  SearchResponse copyWith({
    int? found,
    String? display,
    List<List<double>>? boundedBy,
  }) =>
      SearchResponse(
        found: found ?? _found,
        display: display ?? _display,
        boundedBy: boundedBy ?? _boundedBy,
      );
  int? get found => _found;
  String? get display => _display;
  List<List<double>>? get boundedBy => _boundedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['found'] = _found;
    map['display'] = _display;
    map['boundedBy'] = _boundedBy;
    return map;
  }
}

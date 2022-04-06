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

class Properties {
  Properties({
    String? name,
    String? description,
    GeocoderMetaData? geocoderMetaData,
    ResponseMetaData? responseMetaData,
  }) {
    _name = name;
    _description = description;

    _geocoderMetaData = geocoderMetaData;
  }

  Properties.fromJson(dynamic json) {
    _name = json['name'];
    _description = json['description'];
    _geocoderMetaData = json['GeocoderMetaData'] != null
        ? GeocoderMetaData.fromJson(json['GeocoderMetaData'])
        : null;
  }
  String? _name;
  String? _description;

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
        geocoderMetaData: geocoderMetaData ?? _geocoderMetaData,
      );
  String? get name => _name;
  String? get description => _description;
  GeocoderMetaData? get geocoderMetaData => _geocoderMetaData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['description'] = _description;
    if (_geocoderMetaData != null) {
      map['GeocoderMetaData'] = _geocoderMetaData?.toJson();
    }
    return map;
  }
}

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

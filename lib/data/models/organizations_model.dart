class OrganizationsModel {
  OrganizationsModel({
    String? type,
    Properties0? properties,
    List<Features>? features,
  }) {
    _type = type;
    _properties = properties;
    _features = features;
  }

  OrganizationsModel.fromJson(dynamic json) {
    _type = json['type'];
    _properties = json['properties'] != null
        ? Properties0.fromJson(json['properties'])
        : null;
    if (json['features'] != null) {
      _features = [];
      json['features'].forEach((v) {
        _features?.add(Features.fromJson(v));
      });
    }
  }
  String? _type;
  Properties0? _properties;
  List<Features>? _features;
  OrganizationsModel copyWith({
    String? type,
    Properties0? properties,
    List<Features>? features,
  }) =>
      OrganizationsModel(
        type: type ?? _type,
        properties: properties ?? _properties,
        features: features ?? _features,
      );
  String? get type => _type;
  Properties0? get properties => _properties;
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
    List<List<double>>? boundedBy,
    CompanyMetaData? companyMetaData,
  }) {
    _name = name;
    _description = description;
    _boundedBy = boundedBy;
    _companyMetaData = companyMetaData;
  }

  Properties.fromJson(dynamic json) {
    _name = json['name'];
    _description = json['description'];
    _boundedBy =
        json['boundedBy'] != null ? json['boundedBy'].cast<double>() : [];
    _companyMetaData = json['CompanyMetaData'] != null
        ? CompanyMetaData.fromJson(json['CompanyMetaData'])
        : null;
  }
  String? _name;
  String? _description;
  List<List<double>>? _boundedBy;
  CompanyMetaData? _companyMetaData;
  Properties copyWith({
    String? name,
    String? description,
    List<List<double>>? boundedBy,
    CompanyMetaData? companyMetaData,
  }) =>
      Properties(
        name: name ?? _name,
        description: description ?? _description,
        boundedBy: boundedBy ?? _boundedBy,
        companyMetaData: companyMetaData ?? _companyMetaData,
      );
  String? get name => _name;
  String? get description => _description;
  List<List<double>>? get boundedBy => _boundedBy;
  CompanyMetaData? get companyMetaData => _companyMetaData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['description'] = _description;
    map['boundedBy'] = _boundedBy;
    if (_companyMetaData != null) {
      map['CompanyMetaData'] = _companyMetaData?.toJson();
    }
    return map;
  }
}

class CompanyMetaData {
  CompanyMetaData({
    String? id,
    String? name,
    String? address,
    String? url,
    List<Phones>? phones,
    List<Categories>? categories,
    Hours? hours,
  }) {
    _id = id;
    _name = name;
    _address = address;
    _url = url;
    _phones = phones;
    _categories = categories;
    _hours = hours;
  }

  CompanyMetaData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _address = json['address'];
    _url = json['url'];
    if (json['Phones'] != null) {
      _phones = [];
      json['Phones'].forEach((v) {
        _phones?.add(Phones.fromJson(v));
      });
    }
    if (json['Categories'] != null) {
      _categories = [];
      json['Categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
    _hours = json['Hours'] != null ? Hours.fromJson(json['Hours']) : null;
  }
  String? _id;
  String? _name;
  String? _address;
  String? _url;
  List<Phones>? _phones;
  List<Categories>? _categories;
  Hours? _hours;
  CompanyMetaData copyWith({
    String? id,
    String? name,
    String? address,
    String? url,
    List<Phones>? phones,
    List<Categories>? categories,
    Hours? hours,
  }) =>
      CompanyMetaData(
        id: id ?? _id,
        name: name ?? _name,
        address: address ?? _address,
        url: url ?? _url,
        phones: phones ?? _phones,
        categories: categories ?? _categories,
        hours: hours ?? _hours,
      );
  String? get id => _id;
  String? get name => _name;
  String? get address => _address;
  String? get url => _url;
  List<Phones>? get phones => _phones;
  List<Categories>? get categories => _categories;
  Hours? get hours => _hours;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['address'] = _address;
    map['url'] = _url;
    if (_phones != null) {
      map['Phones'] = _phones?.map((v) => v.toJson()).toList();
    }
    if (_categories != null) {
      map['Categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    if (_hours != null) {
      map['Hours'] = _hours?.toJson();
    }
    return map;
  }
}

class Hours {
  Hours({
    String? text,
    List<Availabilities>? availabilities,
  }) {
    _text = text;
    _availabilities = availabilities;
  }

  Hours.fromJson(dynamic json) {
    _text = json['text'];
    if (json['Availabilities'] != null) {
      _availabilities = [];
      json['Availabilities'].forEach((v) {
        _availabilities?.add(Availabilities.fromJson(v));
      });
    }
  }
  String? _text;
  List<Availabilities>? _availabilities;
  Hours copyWith({
    String? text,
    List<Availabilities>? availabilities,
  }) =>
      Hours(
        text: text ?? _text,
        availabilities: availabilities ?? _availabilities,
      );
  String? get text => _text;
  List<Availabilities>? get availabilities => _availabilities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = _text;
    if (_availabilities != null) {
      map['Availabilities'] = _availabilities?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Availabilities {
  Availabilities({
    List<Intervals>? intervals,
    bool? everyday,
  }) {
    _intervals = intervals;
    _everyday = everyday;
  }

  Availabilities.fromJson(dynamic json) {
    if (json['Intervals'] != null) {
      _intervals = [];
      json['Intervals'].forEach((v) {
        _intervals?.add(Intervals.fromJson(v));
      });
    }
    _everyday = json['Everyday'];
  }
  List<Intervals>? _intervals;
  bool? _everyday;
  Availabilities copyWith({
    List<Intervals>? intervals,
    bool? everyday,
  }) =>
      Availabilities(
        intervals: intervals ?? _intervals,
        everyday: everyday ?? _everyday,
      );
  List<Intervals>? get intervals => _intervals;
  bool? get everyday => _everyday;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_intervals != null) {
      map['Intervals'] = _intervals?.map((v) => v.toJson()).toList();
    }
    map['Everyday'] = _everyday;
    return map;
  }
}

class Intervals {
  Intervals({
    String? from,
    String? to,
  }) {
    _from = from;
    _to = to;
  }

  Intervals.fromJson(dynamic json) {
    _from = json['from'];
    _to = json['to'];
  }
  String? _from;
  String? _to;
  Intervals copyWith({
    String? from,
    String? to,
  }) =>
      Intervals(
        from: from ?? _from,
        to: to ?? _to,
      );
  String? get from => _from;
  String? get to => _to;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['from'] = _from;
    map['to'] = _to;
    return map;
  }
}

class Categories {
  Categories({
    String? class0,
    String? name,
  }) {
    _class = class0;
    _name = name;
  }

  Categories.fromJson(dynamic json) {
    _class = json['class'];
    _name = json['name'];
  }
  String? _class;
  String? _name;
  Categories copyWith({
    String? class0,
    String? name,
  }) =>
      Categories(
        class0: class0 ?? _class,
        name: name ?? _name,
      );
  String? get class0 => _class;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['class'] = _class;
    map['name'] = _name;
    return map;
  }
}

class Phones {
  Phones({
    String? type,
    String? formatted,
  }) {
    _type = type;
    _formatted = formatted;
  }

  Phones.fromJson(dynamic json) {
    _type = json['type'];
    _formatted = json['formatted'];
  }
  String? _type;
  String? _formatted;
  Phones copyWith({
    String? type,
    String? formatted,
  }) =>
      Phones(
        type: type ?? _type,
        formatted: formatted ?? _formatted,
      );
  String? get type => _type;
  String? get formatted => _formatted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['formatted'] = _formatted;
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

class Properties0 {
  Properties0({
    ResponseMetaData? responseMetaData,
  }) {
    _responseMetaData = responseMetaData;
  }

  Properties0.fromJson(dynamic json) {
    _responseMetaData = json['ResponseMetaData'] != null
        ? ResponseMetaData.fromJson(json['ResponseMetaData'])
        : null;
  }
  ResponseMetaData? _responseMetaData;
  Properties0 copyWith({
    ResponseMetaData? responseMetaData,
  }) =>
      Properties0(
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
  }) {
    _found = found;
    _display = display;
  }

  SearchResponse.fromJson(dynamic json) {
    _found = json['found'];
    _display = json['display'];
  }
  int? _found;
  String? _display;
  SearchResponse copyWith({
    int? found,
    String? display,
  }) =>
      SearchResponse(
        found: found ?? _found,
        display: display ?? _display,
      );
  int? get found => _found;
  String? get display => _display;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['found'] = _found;
    map['display'] = _display;
    return map;
  }
}

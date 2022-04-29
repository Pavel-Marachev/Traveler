class InterestingPlacesModel {
  InterestingPlacesModel({
    String? type,
    List<Features>? features,
  }) {
    _type = type;
    _features = features;
  }

  InterestingPlacesModel.fromJson(dynamic json) {
    _type = json['type'];
    if (json['features'] != null) {
      _features = [];
      json['features'].forEach((v) {
        _features?.add(Features.fromJson(v));
      });
    }
  }
  String? _type;
  List<Features>? _features;
  InterestingPlacesModel copyWith({
    String? type,
    List<Features>? features,
  }) =>
      InterestingPlacesModel(
        type: type ?? _type,
        features: features ?? _features,
      );
  String? get type => _type;
  List<Features>? get features => _features;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    if (_features != null) {
      map['features'] = _features?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Features {
  Features({
    String? type,
    String? id,
    Geometry? geometry,
    Properties? properties,
  }) {
    _type = type;
    _id = id;
    _geometry = geometry;
    _properties = properties;
  }

  Features.fromJson(dynamic json) {
    _type = json['type'];
    _id = json['id'];
    _geometry =
        json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    _properties = json['properties'] != null
        ? Properties.fromJson(json['properties'])
        : null;
  }
  String? _type;
  String? _id;
  Geometry? _geometry;
  Properties? _properties;
  Features copyWith({
    String? type,
    String? id,
    Geometry? geometry,
    Properties? properties,
  }) =>
      Features(
        type: type ?? _type,
        id: id ?? _id,
        geometry: geometry ?? _geometry,
        properties: properties ?? _properties,
      );
  String? get type => _type;
  String? get id => _id;
  Geometry? get geometry => _geometry;
  Properties? get properties => _properties;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['id'] = _id;
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
    String? xid,
    String? name,
    double? dist,
    int? rate,
    String? osm,
    String? kinds,
  }) {
    _xid = xid;
    _name = name;
    _dist = dist;
    _rate = rate;
    _osm = osm;
    _kinds = kinds;
  }

  Properties.fromJson(dynamic json) {
    _xid = json['xid'];
    _name = json['name'];
    _dist = json['dist'];
    _rate = json['rate'];
    _osm = json['osm'];
    _kinds = json['kinds'];
  }
  String? _xid;
  String? _name;
  double? _dist;
  int? _rate;
  String? _osm;
  String? _kinds;
  Properties copyWith({
    String? xid,
    String? name,
    double? dist,
    int? rate,
    String? osm,
    String? kinds,
  }) =>
      Properties(
        xid: xid ?? _xid,
        name: name ?? _name,
        dist: dist ?? _dist,
        rate: rate ?? _rate,
        osm: osm ?? _osm,
        kinds: kinds ?? _kinds,
      );
  String? get xid => _xid;
  String? get name => _name;
  double? get dist => _dist;
  int? get rate => _rate;
  String? get osm => _osm;
  String? get kinds => _kinds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['xid'] = _xid;
    map['name'] = _name;
    map['dist'] = _dist;
    map['rate'] = _rate;
    map['osm'] = _osm;
    map['kinds'] = _kinds;
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

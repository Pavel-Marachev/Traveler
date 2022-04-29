class PlaceInformationModel {
  PlaceInformationModel({
    String? xid,
    String? name,
    Address? address,
    String? rate,
    String? wikidata,
    String? kinds,
    Sources? sources,
    String? otm,
    String? wikipedia,
    String? image,
    Preview? preview,
    WikipediaExtracts? wikipediaExtracts,
    Point? point,
  }) {
    _xid = xid;
    _name = name;
    _address = address;
    _rate = rate;
    _wikidata = wikidata;
    _kinds = kinds;
    _sources = sources;
    _otm = otm;
    _wikipedia = wikipedia;
    _image = image;
    _preview = preview;
    _wikipediaExtracts = wikipediaExtracts;
    _point = point;
  }

  PlaceInformationModel.fromJson(dynamic json) {
    _xid = json['xid'];
    _name = json['name'];
    _address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    _rate = json['rate'];
    _wikidata = json['wikidata'];
    _kinds = json['kinds'];
    _sources =
        json['sources'] != null ? Sources.fromJson(json['sources']) : null;
    _otm = json['otm'];
    _wikipedia = json['wikipedia'];
    _image = json['image'];
    _preview =
        json['preview'] != null ? Preview.fromJson(json['preview']) : null;
    _wikipediaExtracts = json['wikipedia_extracts'] != null
        ? WikipediaExtracts.fromJson(json['wikipedia_extracts'])
        : null;
    _point = json['point'] != null ? Point.fromJson(json['point']) : null;
  }
  String? _xid;
  String? _name;
  Address? _address;
  String? _rate;
  String? _wikidata;
  String? _kinds;
  Sources? _sources;
  String? _otm;
  String? _wikipedia;
  String? _image;
  Preview? _preview;
  WikipediaExtracts? _wikipediaExtracts;
  Point? _point;
  PlaceInformationModel copyWith({
    String? xid,
    String? name,
    Address? address,
    String? rate,
    String? wikidata,
    String? kinds,
    Sources? sources,
    String? otm,
    String? wikipedia,
    String? image,
    Preview? preview,
    WikipediaExtracts? wikipediaExtracts,
    Point? point,
  }) =>
      PlaceInformationModel(
        xid: xid ?? _xid,
        name: name ?? _name,
        address: address ?? _address,
        rate: rate ?? _rate,
        wikidata: wikidata ?? _wikidata,
        kinds: kinds ?? _kinds,
        sources: sources ?? _sources,
        otm: otm ?? _otm,
        wikipedia: wikipedia ?? _wikipedia,
        image: image ?? _image,
        preview: preview ?? _preview,
        wikipediaExtracts: wikipediaExtracts ?? _wikipediaExtracts,
        point: point ?? _point,
      );
  String? get xid => _xid;
  String? get name => _name;
  Address? get address => _address;
  String? get rate => _rate;
  String? get wikidata => _wikidata;
  String? get kinds => _kinds;
  Sources? get sources => _sources;
  String? get otm => _otm;
  String? get wikipedia => _wikipedia;
  String? get image => _image;
  Preview? get preview => _preview;
  WikipediaExtracts? get wikipediaExtracts => _wikipediaExtracts;
  Point? get point => _point;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['xid'] = _xid;
    map['name'] = _name;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    map['rate'] = _rate;
    map['wikidata'] = _wikidata;
    map['kinds'] = _kinds;
    if (_sources != null) {
      map['sources'] = _sources?.toJson();
    }
    map['otm'] = _otm;
    map['wikipedia'] = _wikipedia;
    map['image'] = _image;
    if (_preview != null) {
      map['preview'] = _preview?.toJson();
    }
    if (_wikipediaExtracts != null) {
      map['wikipedia_extracts'] = _wikipediaExtracts?.toJson();
    }
    if (_point != null) {
      map['point'] = _point?.toJson();
    }
    return map;
  }
}

class Point {
  Point({
    double? lon,
    double? lat,
  }) {
    _lon = lon;
    _lat = lat;
  }

  Point.fromJson(dynamic json) {
    _lon = json['lon'];
    _lat = json['lat'];
  }
  double? _lon;
  double? _lat;
  Point copyWith({
    double? lon,
    double? lat,
  }) =>
      Point(
        lon: lon ?? _lon,
        lat: lat ?? _lat,
      );
  double? get lon => _lon;
  double? get lat => _lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = _lon;
    map['lat'] = _lat;
    return map;
  }
}

class WikipediaExtracts {
  WikipediaExtracts({
    String? title,
    String? text,
    String? html,
  }) {
    _title = title;
    _text = text;
    _html = html;
  }

  WikipediaExtracts.fromJson(dynamic json) {
    _title = json['title'];
    _text = json['text'];
    _html = json['html'];
  }
  String? _title;
  String? _text;
  String? _html;
  WikipediaExtracts copyWith({
    String? title,
    String? text,
    String? html,
  }) =>
      WikipediaExtracts(
        title: title ?? _title,
        text: text ?? _text,
        html: html ?? _html,
      );
  String? get title => _title;
  String? get text => _text;
  String? get html => _html;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['text'] = _text;
    map['html'] = _html;
    return map;
  }
}

class Preview {
  Preview({
    String? source,
    int? height,
    int? width,
  }) {
    _source = source;
    _height = height;
    _width = width;
  }

  Preview.fromJson(dynamic json) {
    _source = json['source'];
    _height = json['height'];
    _width = json['width'];
  }
  String? _source;
  int? _height;
  int? _width;
  Preview copyWith({
    String? source,
    int? height,
    int? width,
  }) =>
      Preview(
        source: source ?? _source,
        height: height ?? _height,
        width: width ?? _width,
      );
  String? get source => _source;
  int? get height => _height;
  int? get width => _width;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['source'] = _source;
    map['height'] = _height;
    map['width'] = _width;
    return map;
  }
}

class Sources {
  Sources({
    String? geometry,
    List<String>? attributes,
  }) {
    _geometry = geometry;
    _attributes = attributes;
  }

  Sources.fromJson(dynamic json) {
    _geometry = json['geometry'];
    _attributes =
        json['attributes'] != null ? json['attributes'].cast<String>() : [];
  }
  String? _geometry;
  List<String>? _attributes;
  Sources copyWith({
    String? geometry,
    List<String>? attributes,
  }) =>
      Sources(
        geometry: geometry ?? _geometry,
        attributes: attributes ?? _attributes,
      );
  String? get geometry => _geometry;
  List<String>? get attributes => _attributes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['geometry'] = _geometry;
    map['attributes'] = _attributes;
    return map;
  }
}

class Address {
  Address({
    String? road,
    String? house,
    String? state,
    String? suburb,
    String? country,
    String? postcode,
    String? countryCode,
    String? houseNumber,
    String? stateDistrict,
  }) {
    _road = road;
    _house = house;
    _state = state;
    _suburb = suburb;
    _country = country;
    _postcode = postcode;
    _countryCode = countryCode;
    _houseNumber = houseNumber;
    _stateDistrict = stateDistrict;
  }

  Address.fromJson(dynamic json) {
    _road = json['road'];
    _house = json['house'];
    _state = json['state'];
    _suburb = json['suburb'];
    _country = json['country'];
    _postcode = json['postcode'];
    _countryCode = json['country_code'];
    _houseNumber = json['house_number'];
    _stateDistrict = json['state_district'];
  }
  String? _road;
  String? _house;
  String? _state;
  String? _suburb;
  String? _country;
  String? _postcode;
  String? _countryCode;
  String? _houseNumber;
  String? _stateDistrict;
  Address copyWith({
    String? road,
    String? house,
    String? state,
    String? suburb,
    String? country,
    String? postcode,
    String? countryCode,
    String? houseNumber,
    String? stateDistrict,
  }) =>
      Address(
        road: road ?? _road,
        house: house ?? _house,
        state: state ?? _state,
        suburb: suburb ?? _suburb,
        country: country ?? _country,
        postcode: postcode ?? _postcode,
        countryCode: countryCode ?? _countryCode,
        houseNumber: houseNumber ?? _houseNumber,
        stateDistrict: stateDistrict ?? _stateDistrict,
      );
  String? get road => _road;
  String? get house => _house;
  String? get state => _state;
  String? get suburb => _suburb;
  String? get country => _country;
  String? get postcode => _postcode;
  String? get countryCode => _countryCode;
  String? get houseNumber => _houseNumber;
  String? get stateDistrict => _stateDistrict;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['road'] = _road;
    map['house'] = _house;
    map['state'] = _state;
    map['suburb'] = _suburb;
    map['country'] = _country;
    map['postcode'] = _postcode;
    map['country_code'] = _countryCode;
    map['house_number'] = _houseNumber;
    map['state_district'] = _stateDistrict;
    return map;
  }
}

class UniversityModel {
  String? country;
  List<String>? domains;
  String? alphaTwoCode;
  String? stateProvince;
  List<String>? webPages;
  String? name;
  UniversityModel(
      {this.country,
      this.domains,
      this.alphaTwoCode,
      this.stateProvince,
      this.webPages,
      this.name});

  UniversityModel.fromJson(dynamic json) {
    country = json['country'];
    domains = json['domains'].cast<String>();
    alphaTwoCode = json['alpha_two_code'];
    stateProvince = json['state-province'];
    webPages = json['web_pages'].cast<String>();
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['country'] = country;
    map['domains'] = domains;
    map['alpha_two_code'] = alphaTwoCode;
    map['state-province'] = stateProvince;
    map['web_pages'] = webPages;
    map['name'] = name;
    return map;
  }
}

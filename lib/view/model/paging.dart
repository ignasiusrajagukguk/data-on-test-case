/// page : 1
/// per_page : 10

class Paging {
  int? page;
  int? perPage;

  Paging({
    this.page = 1,
    this.perPage = 10,
  });

  Paging.fromJson(dynamic json) {
    page = json['page'] ?? 1;
    perPage = json['per_page'] ?? 10;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['page'] = page;
    map['per_page'] = perPage;
    return map;
  }

  Paging copyWith({
    int? page,
    int? perPage,
  }) {
    return Paging(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
    );
  }
}

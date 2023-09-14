import 'dart:convert';

PokedexResponse pokedexResponseFromJson(String str) =>
    PokedexResponse.fromJson(json.decode(str));

String pokedexResponseToJson(PokedexResponse data) =>
    json.encode(data.toJson());

class PokedexResponse {
  PokedexResponse({
    required this.count,
    required this.next,
    this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<PokedexList> results;

  factory PokedexResponse.fromJson(Map<String, dynamic> json) =>
      PokedexResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<PokedexList>.from(
            json["results"].map((x) => PokedexList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class PokedexList {
  PokedexList({
    required this.name,
    required this.url,
    required this.id
  });

  String name;
  String url;
  String id;

  factory PokedexList.fromJson(Map<String, dynamic> json) {
    List<String> split = json["url"].split("/");
    String lastNumber = split[split.length - 2];

    return PokedexList(
        name: json["name"],
        url: json["url"],
        id: lastNumber
      );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "id": id
      };
}

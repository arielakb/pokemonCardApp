import 'dart:convert';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
  Data data;

  Pokemon({
    required this.data,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  String id;
  String name;
  String supertype;
  List<String> subtypes;
  String hp;
  List<String> types;
  List<String> evolvesTo;
  List<String> rules;
  List<Attack> attacks;
  List<Weakness> weaknesses;
  List<String> retreatCost;
  int convertedRetreatCost;
  Set dataSet;
  String number;
  String artist;
  String rarity;
  List<int> nationalPokedexNumbers;
  Legalities legalities;
  DataImages images;
  Tcgplayer tcgplayer;

  Data({
    required this.id,
    required this.name,
    required this.supertype,
    required this.subtypes,
    required this.hp,
    required this.types,
    required this.evolvesTo,
    required this.rules,
    required this.attacks,
    required this.weaknesses,
    required this.retreatCost,
    required this.convertedRetreatCost,
    required this.dataSet,
    required this.number,
    required this.artist,
    required this.rarity,
    required this.nationalPokedexNumbers,
    required this.legalities,
    required this.images,
    required this.tcgplayer,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        supertype: json["supertype"],
        subtypes: List<String>.from(json["subtypes"].map((x) => x)),
        hp: json["hp"],
        types: List<String>.from(json["types"].map((x) => x)),
        evolvesTo: List<String>.from(json["evolvesTo"].map((x) => x)),
        rules: List<String>.from(json["rules"].map((x) => x)),
        attacks:
            List<Attack>.from(json["attacks"].map((x) => Attack.fromJson(x))),
        weaknesses: List<Weakness>.from(
            json["weaknesses"].map((x) => Weakness.fromJson(x))),
        retreatCost: List<String>.from(json["retreatCost"].map((x) => x)),
        convertedRetreatCost: json["convertedRetreatCost"],
        dataSet: Set.fromJson(json["set"]),
        number: json["number"],
        artist: json["artist"],
        rarity: json["rarity"],
        nationalPokedexNumbers:
            List<int>.from(json["nationalPokedexNumbers"].map((x) => x)),
        legalities: Legalities.fromJson(json["legalities"]),
        images: DataImages.fromJson(json["images"]),
        tcgplayer: Tcgplayer.fromJson(json["tcgplayer"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "supertype": supertype,
        "subtypes": List<dynamic>.from(subtypes.map((x) => x)),
        "hp": hp,
        "types": List<dynamic>.from(types.map((x) => x)),
        "evolvesTo": List<dynamic>.from(evolvesTo.map((x) => x)),
        "rules": List<dynamic>.from(rules.map((x) => x)),
        "attacks": List<dynamic>.from(attacks.map((x) => x.toJson())),
        "weaknesses": List<dynamic>.from(weaknesses.map((x) => x.toJson())),
        "retreatCost": List<dynamic>.from(retreatCost.map((x) => x)),
        "convertedRetreatCost": convertedRetreatCost,
        "set": dataSet.toJson(),
        "number": number,
        "artist": artist,
        "rarity": rarity,
        "nationalPokedexNumbers":
            List<dynamic>.from(nationalPokedexNumbers.map((x) => x)),
        "legalities": legalities.toJson(),
        "images": images.toJson(),
        "tcgplayer": tcgplayer.toJson(),
      };
}

class Attack {
  String name;
  List<String> cost;
  int convertedEnergyCost;
  String damage;
  String text;

  Attack({
    required this.name,
    required this.cost,
    required this.convertedEnergyCost,
    required this.damage,
    required this.text,
  });

  factory Attack.fromJson(Map<String, dynamic> json) => Attack(
        name: json["name"],
        cost: List<String>.from(json["cost"].map((x) => x)),
        convertedEnergyCost: json["convertedEnergyCost"],
        damage: json["damage"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "cost": List<dynamic>.from(cost.map((x) => x)),
        "convertedEnergyCost": convertedEnergyCost,
        "damage": damage,
        "text": text,
      };
}

class Set {
  String id;
  String name;
  String series;
  int printedTotal;
  int total;
  Legalities legalities;
  String ptcgoCode;
  String releaseDate;
  String updatedAt;
  SetImages images;

  Set({
    required this.id,
    required this.name,
    required this.series,
    required this.printedTotal,
    required this.total,
    required this.legalities,
    required this.ptcgoCode,
    required this.releaseDate,
    required this.updatedAt,
    required this.images,
  });

  factory Set.fromJson(Map<String, dynamic> json) => Set(
        id: json["id"],
        name: json["name"],
        series: json["series"],
        printedTotal: json["printedTotal"],
        total: json["total"],
        legalities: Legalities.fromJson(json["legalities"]),
        ptcgoCode: json["ptcgoCode"],
        releaseDate: json["releaseDate"],
        updatedAt: json["updatedAt"],
        images: SetImages.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "series": series,
        "printedTotal": printedTotal,
        "total": total,
        "legalities": legalities.toJson(),
        "ptcgoCode": ptcgoCode,
        "releaseDate": releaseDate,
        "updatedAt": updatedAt,
        "images": images.toJson(),
      };
}

class SetImages {
  String symbol;
  String logo;

  SetImages({
    required this.symbol,
    required this.logo,
  });

  factory SetImages.fromJson(Map<String, dynamic> json) => SetImages(
        symbol: json["symbol"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "logo": logo,
      };
}

class Legalities {
  String unlimited;
  String expanded;

  Legalities({
    required this.unlimited,
    required this.expanded,
  });

  factory Legalities.fromJson(Map<String, dynamic> json) => Legalities(
        unlimited: json["unlimited"],
        expanded: json["expanded"],
      );

  Map<String, dynamic> toJson() => {
        "unlimited": unlimited,
        "expanded": expanded,
      };
}

class DataImages {
  String small;
  String large;

  DataImages({
    required this.small,
    required this.large,
  });

  factory DataImages.fromJson(Map<String, dynamic> json) => DataImages(
        small: json["small"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "large": large,
      };
}

class Tcgplayer {
  String url;
  String updatedAt;
  Prices prices;

  Tcgplayer({
    required this.url,
    required this.updatedAt,
    required this.prices,
  });

  factory Tcgplayer.fromJson(Map<String, dynamic> json) => Tcgplayer(
        url: json["url"],
        updatedAt: json["updatedAt"],
        prices: Prices.fromJson(json["prices"]),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "updatedAt": updatedAt,
        "prices": prices.toJson(),
      };
}

class Prices {
  Holofoil holofoil;

  Prices({
    required this.holofoil,
  });

  factory Prices.fromJson(Map<String, dynamic> json) => Prices(
        holofoil: Holofoil.fromJson(json["holofoil"]),
      );

  Map<String, dynamic> toJson() => {
        "holofoil": holofoil.toJson(),
      };
}

class Holofoil {
  int low;
  double mid;
  double high;
  double market;
  double directLow;

  Holofoil({
    required this.low,
    required this.mid,
    required this.high,
    required this.market,
    required this.directLow,
  });

  factory Holofoil.fromJson(Map<String, dynamic> json) => Holofoil(
        low: json["low"],
        mid: json["mid"]?.toDouble(),
        high: json["high"]?.toDouble(),
        market: json["market"]?.toDouble(),
        directLow: json["directLow"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "low": low,
        "mid": mid,
        "high": high,
        "market": market,
        "directLow": directLow,
      };
}

class Weakness {
  String type;
  String value;

  Weakness({
    required this.type,
    required this.value,
  });

  factory Weakness.fromJson(Map<String, dynamic> json) => Weakness(
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
      };
}

class PokemonData {
  String name;
  String url;

  PokemonData({
    required this.name,
    required this.url,
  });

  factory PokemonData.fromJson(Map<String, dynamic> json) {
    return PokemonData(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }

  String get newUrl {
    return 'https://th.portal-pokemon.com/play/resources/pokedex/img/pm/5794f0251b1180998d72d1f8568239620ff5279c.png';
  }
}

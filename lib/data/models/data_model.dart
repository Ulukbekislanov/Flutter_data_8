class DataModel {
  DataModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.nameid,
    required this.rank,
  });
  final String id;
  final String symbol;
  final String name;
  final String nameid;
  final int rank;
    factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      nameid: json['nameid'],
      rank: json['rank'],
    );
  }
}


import 'package:equatable/equatable.dart';

class PokeListItemModel extends Equatable {
  final String name;
  final String url;

  const PokeListItemModel({required this.name, required this.url});

  factory PokeListItemModel.fromJson(Map<String, dynamic> json) {
    return PokeListItemModel(name: json['name'], url: json['url']);
  }

  PokeListItemModel copyWith({String? name, String? url}) {
    return PokeListItemModel(name: name ?? this.name, url: url ?? this.url);
  }

  String get capitalizedName {
    if (name.isEmpty) return name;
    return name[0].toUpperCase() + name.substring(1);
  }

  @override
  List<Object?> get props => [name, url];
}

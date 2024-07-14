import 'package:hive_flutter/hive_flutter.dart';
part 'boid.g.dart';

@HiveType(typeId: 0)
class Boid extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String boidNumber;

  Boid({
    required this.name,
    required this.boidNumber,
  });

  factory Boid.fromJson(Map<String, dynamic> json) {
    return Boid(
      name: json['name'] ?? '',
      boidNumber: json['boidNumber'] ?? '',
    );
  }
}

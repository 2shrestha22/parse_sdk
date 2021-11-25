import 'dart:convert';

class PC {
  final String cpu;
  final String ram;
  final String disk;

  PC(this.cpu, this.ram, this.disk);

  Map<String, dynamic> toMap() {
    return {
      'cpu': cpu,
      'ram': ram,
      'disk': disk,
    };
  }

  factory PC.fromMap(Map<String, dynamic> map) {
    return PC(
      map['cpu'],
      map['ram'],
      map['disk'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PC.fromJson(String source) => PC.fromMap(json.decode(source));
}

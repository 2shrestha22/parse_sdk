import 'dart:convert';

class PC {
  final String? cpu;
  final String? ram;
  final String? disk;
  PC({
    this.cpu,
    this.ram,
    this.disk,
  });

  PC copyWith({
    String? cpu,
    String? ram,
    String? disk,
  }) {
    return PC(
      cpu: cpu ?? this.cpu,
      ram: ram ?? this.ram,
      disk: disk ?? this.disk,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cpu': cpu,
      'ram': ram,
      'disk': disk,
    };
  }

  factory PC.fromMap(Map<String, dynamic> map) {
    return PC(
      cpu: map['cpu'] != null ? map['cpu'] : null,
      ram: map['ram'] != null ? map['ram'] : null,
      disk: map['disk'] != null ? map['disk'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PC.fromJson(String source) => PC.fromMap(json.decode(source));

  @override
  String toString() => 'PC(cpu: $cpu, ram: $ram, disk: $disk)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PC &&
        other.cpu == cpu &&
        other.ram == ram &&
        other.disk == disk;
  }

  @override
  int get hashCode => cpu.hashCode ^ ram.hashCode ^ disk.hashCode;
}

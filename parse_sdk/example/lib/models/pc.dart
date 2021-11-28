import 'dart:convert';

class PC {
  final String? cpu;
  final String? ram;
  final String? disk;
  final DateTime? createdAt;
  PC({
    this.cpu,
    this.ram,
    this.disk,
    this.createdAt,
  });

  PC copyWith({
    String? cpu,
    String? ram,
    String? disk,
    DateTime? createdAt,
  }) {
    return PC(
      cpu: cpu ?? this.cpu,
      ram: ram ?? this.ram,
      disk: disk ?? this.disk,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cpu': cpu,
      'ram': ram,
      'disk': disk,
      'createdAt': createdAt?.millisecondsSinceEpoch,
    };
  }

  factory PC.fromMap(Map<String, dynamic> map) {
    return PC(
      cpu: map['cpu'] != null ? map['cpu'] : null,
      ram: map['ram'] != null ? map['ram'] : null,
      disk: map['disk'] != null ? map['disk'] : null,
      createdAt:
          map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PC.fromJson(String source) => PC.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PC(cpu: $cpu, ram: $ram, disk: $disk, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PC &&
        other.cpu == cpu &&
        other.ram == ram &&
        other.disk == disk &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return cpu.hashCode ^ ram.hashCode ^ disk.hashCode ^ createdAt.hashCode;
  }
}

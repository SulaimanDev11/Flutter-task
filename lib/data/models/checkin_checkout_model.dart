class BreakTimeModel {
  final DateTime start;
  final DateTime end;

  BreakTimeModel({
    required this.start,
    required this.end,
  });

  Map<String, dynamic> toJson() {
    return {
      "start": start.toIso8601String(),
      "end": end.toIso8601String(),
    };
  }
}

class AgeResult {
  final String age;
  final double percent10;
  final double percent20;
  final double percent30;
  final double percent40;
  final double percent50;
  final double percent60;
  final double percent70;

  AgeResult({
    required this.age,
    required this.percent10,
    required this.percent20,
    required this.percent30,
    required this.percent40,
    required this.percent50,
    required this.percent60,
    required this.percent70,
  });

  factory AgeResult.fromJson(Map<String, dynamic> json) {
    return AgeResult(
      age: json['age'],
      percent10: json['percent'][0],
      percent20: json['percent'][1],
      percent30: json['percent'][2],
      percent40: json['percent'][3],
      percent50: json['percent'][4],
      percent60: json['percent'][5],
      percent70: json['percent'][6],
    );
  }
}
class Demo {
  final String? name;
  final int? age;

  Demo({
    this.name,
    this.age,
  });
  factory Demo.fromJson(Map<String, dynamic> parsedJson) {
    return new Demo(
      name: parsedJson['name'] ?? "",
      age: parsedJson['age'] ?? "");
  }
}

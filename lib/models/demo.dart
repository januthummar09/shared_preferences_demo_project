class Demo {
  final String? name;
  final int? age;

  Demo({
    this.name,
    this.age,
  });
  factory Demo.fromJson(Map<String, dynamic> parsedJson) {
    return  Demo(
      name: parsedJson['name'] ?? "",
      age: parsedJson['age'] ?? "");
  }
  Map<String,dynamic> toJson(){
    return{
      'name':name,
      'age':age,
    

    };
  }
}

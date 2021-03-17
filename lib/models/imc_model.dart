class ImcModel {
  String sexo;
  int height;
  int weight;
  String age;

  ImcModel({
    this.sexo,
    this.height,
    this.weight,
    this.age,
  });

  set setHeight(int value) {
    this.height = value;
  }

  set setWeight(int value) {
    this.weight = value;
  }

  set setage(String value) {
    this.age = value;
  }
}

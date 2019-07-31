import 'dart:convert';

// Json converters

Machine machineFromJson(String str) {
  final jsonData = json.decode(str);
  return Machine.fromJson(jsonData);
}

String machineToJson(Machine data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

List<Machine> allMachinesFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Machine>.from(jsonData.map((x) => Machine.fromJson(x)));
}

String allMachinesToJson(List<Machine> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Machine {

  // Members
  String id;
  bool isSelected;

  // Constructor
  Machine({this.id}) {
    isSelected = false;
  }

  factory Machine.fromJson(Map<String, dynamic> json) => new Machine(id: json["id"]);

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}
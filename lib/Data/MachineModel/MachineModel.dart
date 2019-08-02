import 'dart:convert';

// Json converters

MachineModel machineFromJson(String str) {
  final jsonData = json.decode(str);
  return MachineModel.fromJson(jsonData);
}

String machineToJson(MachineModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

List<MachineModel> allMachinesFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<MachineModel>.from(jsonData["Items"].map((x) => MachineModel.fromJson(x)));
}

String allMachinesToJson(List<MachineModel> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class MachineModel {

  // Members
  String id;
  bool isSelected;

  // Constructor
  MachineModel({this.id}) {
    isSelected = false;
  }

  factory MachineModel.fromJson(Map<String, dynamic> json) => new MachineModel(id: json["Id"]);

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}
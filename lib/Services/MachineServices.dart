import 'package:http/http.dart' as http;
import 'dart:async';
import '../Data/MachineModel/MachineModel.dart';
import '../Globals.dart';

Future<List<MachineModel>> getAllMachines() async {
  print("request body: {}");
  final response = await http.get(serverURL + "/?TableName=Machines");
  print("response body: " + response.body);
  return allMachinesFromJson(response.body);
}



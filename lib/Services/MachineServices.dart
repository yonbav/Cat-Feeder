import 'package:http/http.dart' as http;
import 'dart:async';
import '../Data/MachineModel/MachineModel.dart';
import '../Globals.dart';

Future<List<MachineModel>> getAllMachines() async {
  final response = await http.get(serverURL + "/?TableName=Machines");
  return allMachinesFromJson(response.body);
}



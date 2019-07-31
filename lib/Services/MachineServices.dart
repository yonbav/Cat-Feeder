import 'package:http/http.dart' as http;
import 'dart:async';
import '../Data/Machine/Machine.dart';
import '../Globals.dart';

Future<List<Machine>> getAllMachines() async {
  final response = await http.get(serverURL + "/?TableName=Machines");
  return allMachinesFromJson(response.body);
}



import 'package:cat_feeder/Data/MachineModel/MachineModel.dart';
import 'package:flutter/widgets.dart';
import '../../Services/MachineServices.dart';

class MachineListModel extends ChangeNotifier {

  final List<MachineModel> _machines = [];

  List<MachineModel> get machines => List.unmodifiable(_machines);

  Future reloadAllFromServer() async {
    print("Load All machines from server");
    var machines = await getAllMachines();
    _machines.clear();
    _machines.addAll(machines);
    notifyListeners();
  }  

  void add(MachineModel machine) {
    _machines.add(machine);
    notifyListeners();
  }

  void remove(MachineModel machine) {
    _machines.remove(machine);
    notifyListeners();
  }

  void update(MachineModel machine) {
    this.remove(machine);
    this.add(machine);
    notifyListeners();
  }
  
}
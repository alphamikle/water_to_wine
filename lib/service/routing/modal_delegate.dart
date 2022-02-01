import 'package:flutter/material.dart';
import 'package:water_jug/domain/water_jug/ui/components/capacity_amont_modal.dart';
import 'package:water_jug/domain/water_jug/ui/components/steps_modal.dart';
import 'package:water_jug/service/di/mounted_initializable.dart';

class ModalDelegate implements MountedInitializable {
  late final GlobalKey<ScaffoldState> _rootScaffoldKey;
  BuildContext get _context => _rootScaffoldKey.currentContext!;

  Future<int?> inputWaterCapacity({
    required int currentCapacity,
    required String hint,
  }) async {
    return showModalBottomSheet<int>(
      context: _context,
      isScrollControlled: true,
      builder: (_) => CapacityAmountModal(
        initialValue: currentCapacity,
        hint: hint,
      ),
    );
  }

  Future<void> showSteps() async {
    return showModalBottomSheet(
      context: _context,
      isScrollControlled: true,
      builder: (_) => const StepsModal(),
    );
  }

  @override
  Future<void> mountedInit(GlobalKey<ScaffoldState> rootScaffoldKey) async {
    _rootScaffoldKey = rootScaffoldKey;
  }
}

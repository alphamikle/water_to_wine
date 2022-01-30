import 'package:flutter/material.dart';
import 'package:water_jug/domain/water_jug/ui/components/capacity_amont_modal.dart';
import 'package:water_jug/service/di/mounted_initializable.dart';

class ModalDelegate implements MountedInitializable {
  late final GlobalKey<ScaffoldState> _rootScaffoldKey;

  Future<int?> inputWaterCapacity({
    required int currentCapacity,
    required String hint,
  }) async {
    return showModalBottomSheet<int>(
      context: _rootScaffoldKey.currentContext!,
      isScrollControlled: true,
      builder: (_) => CapacityAmountModal(
        initialValue: currentCapacity,
        hint: hint,
      ),
    );
  }

  @override
  Future<void> mountedInit(GlobalKey<ScaffoldState> rootScaffoldKey) async {
    _rootScaffoldKey = rootScaffoldKey;
  }
}

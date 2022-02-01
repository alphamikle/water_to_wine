import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_jug/domain/water_jug/entities/node.dart';
import 'package:water_jug/domain/water_jug/logic/jug_challenge_state.dart';
import 'package:yalo_locale/lib.dart';

class StepsModal extends StatelessWidget {
  const StepsModal({Key? key}) : super(key: key);

  Widget _stepBuilder(BuildContext context, int index) {
    final LocalizationMessages loc = Messages.of(context);
    final JugChallengeState state = Provider.of(context);
    final Node step = state.steps[index];

    return ListTile(
      subtitle: Text('${loc.jugView.modal.firstJug}${step.first} | ${loc.jugView.modal.secondJug}${step.second}'),
      title: Text('${loc.jugView.modal.step}${index + 1}'),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final int stepsCount = context.select((JugChallengeState frontend) => frontend.steps.length);
    final LocalizationMessages loc = Messages.of(context);

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 100,
        maxHeight: MediaQuery.of(context).size.height / 3,
      ),
      child: stepsCount == 0
          ? Center(child: Text(loc.jugView.modal.noSteps))
          : ListView.builder(
              itemCount: stepsCount,
              itemBuilder: _stepBuilder,
            ),
    );
  }
}

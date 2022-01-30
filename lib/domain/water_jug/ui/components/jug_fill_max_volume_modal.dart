import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:water_jug/domain/water_jug/logic/jug_challenge_frontend.dart';
import 'package:water_jug/domain/water_jug/logic/jug_entity.dart';
import 'package:water_jug/service/tools/paddings.dart';
import 'package:yalo_locale/lib.dart';

class JugFillMaxVolumeModal extends StatefulWidget {
  const JugFillMaxVolumeModal({
    required this.jugId,
    Key? key,
  }) : super(key: key);

  final JugId jugId;

  @override
  State<JugFillMaxVolumeModal> createState() => _JugFillMaxVolumeModalState();
}

class _JugFillMaxVolumeModalState extends State<JugFillMaxVolumeModal> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    final JugChallengeFrontend jugChallengeFrontend = context.read();
    final int currentMaxVolume = jugChallengeFrontend.jugs[widget.jugId]!.maxVolume;
    if (currentMaxVolume > 0) {
      _controller.value = TextEditingValue(text: currentMaxVolume.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final LocalizationMessages loc = Messages.of(context);

    return Padding(
      padding: const EdgeInsets.all(Paddings.x1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: loc.jugView.modal.fieldHint,
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*$')),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: Paddings.x1, bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(int.tryParse(_controller.text)),
                    child: Text(loc.jugView.modal.button),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

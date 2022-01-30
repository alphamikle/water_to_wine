import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_jug/service/tools/paddings.dart';
import 'package:yalo_locale/lib.dart';

class CapacityAmountModal extends StatefulWidget {
  const CapacityAmountModal({
    required this.initialValue,
    Key? key,
  }) : super(key: key);

  final int initialValue;

  @override
  State<CapacityAmountModal> createState() => _CapacityAmountModalState();
}

class _CapacityAmountModalState extends State<CapacityAmountModal> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.initialValue > 0) {
      _controller.value = TextEditingValue(text: widget.initialValue.toString());
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

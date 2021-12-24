import 'package:flutter/material.dart';

class MultipleChoiceRadioListTile extends StatefulWidget {
  final List<String> list;
  int? groupValue;

  MultipleChoiceRadioListTile({
    Key? key, required this.list, required this.groupValue,
  }) : super(key: key);

  @override
  State<MultipleChoiceRadioListTile> createState() =>
      _MultipleChoiceRadioListTileState();
}

class _MultipleChoiceRadioListTileState
    extends State<MultipleChoiceRadioListTile> {

  @override
  void initState() {
    super.initState();
    widget.groupValue = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.list.length*40,
      child: ListView.builder(
        shrinkWrap: true,
        //physics: NeverScrollablePhysics(),
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          return Container(
            height: 40,
            child: RadioListTile(
              value: index,
              groupValue: widget.groupValue,
              title: Text(widget.list[index].toString(),
                  style: Theme
                      .of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.black)),
              onChanged: (val) {
                setState(() {
                  widget.groupValue = int.parse(val.toString());
                });
              },
              activeColor: Colors.red,
            ),
          );
        },
      ),
    );
  }
}

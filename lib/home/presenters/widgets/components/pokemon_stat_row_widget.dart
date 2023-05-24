import 'package:flutter/material.dart';
import 'package:pokedex_versotech/home/presenters/widgets/components/row_divider.dart';

class StatRowWidget extends StatefulWidget {
  final String statTitle;
  final int statNumber;
  final Color color;

  const StatRowWidget(
      {Key? key,
      required this.statTitle,
      required this.statNumber,
      required this.color})
      : super(key: key);

  @override
  State<StatRowWidget> createState() => _StatRowWidgetState();
}

class _StatRowWidgetState extends State<StatRowWidget> {
  int maxStatInt(int statNumber) {
    if (statNumber > 230) {
      return 230;
    } else {
      return statNumber;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statNumber = widget.statNumber;
    final statTitle = widget.statTitle;

    double statPercentage = maxStatInt(statNumber) / 230;

    return Column(
      children: [
        Row(
          children: [
            SizedBox(
                width: 40,
                child: Text(
                  textAlign: TextAlign.right,
                  statTitle,
                  style: TextStyle(
                      color: widget.color,
                      fontWeight: FontWeight.bold,
                      fontSize: 11),
                )),
            const RowDivider(
              height: 20,
              width: 2,
            ),
            statNumber >= 100
                ? Text('$statNumber',
                    style: const TextStyle(fontWeight: FontWeight.w500))
                : Text('0$statNumber',
                    style: const TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(width: 16),
            Expanded(
              child: LayoutBuilder(builder: (_, constraints) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: widget.color.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(200),
                      ),
                      height: 5,
                    ),
                    Container(
                      height: 5,
                      width: statPercentage * constraints.maxWidth,
                      decoration: BoxDecoration(
                        color: widget.color,
                        borderRadius: BorderRadius.circular(200),
                      ),
                    ),
                  ],
                );
              }),
            )
          ],
        ),
      ],
    );
  }
}

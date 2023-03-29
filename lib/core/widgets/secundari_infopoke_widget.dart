import 'package:flutter/material.dart';

import '../theme/backgroud_color.dart';

class SecundariinfopokeWidget extends StatefulWidget {
  const SecundariinfopokeWidget(
      {super.key,
      required this.type,
      required this.candy,
      required this.localization});
  final List<String> type;
  final String candy;
  final String localization;

  @override
  State<SecundariinfopokeWidget> createState() =>
      _SecundariinfopokeWidgetState();
}

class _SecundariinfopokeWidgetState extends State<SecundariinfopokeWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: Text(widget.candy,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.w900,
                            color: Backgroud().getBackgroudType(
                                type: widget.type[0].toString()),
                            fontFamily: 'Nunito')),
                  ),
                  Text('Doce'.toUpperCase(),
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey.withOpacity(0.5),
                          fontFamily: 'Nunito'))
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(widget.localization,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.06,
                          fontWeight: FontWeight.w900,
                          color: Backgroud().getBackgroudType(
                              type: widget.type[0].toString()),
                          fontFamily: 'Nunito')),
                  Text('Localização'.toUpperCase(),
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey.withOpacity(0.5),
                          fontFamily: 'Nunito'))
                ],
              ),
            )
          ]),
    );
  }
}

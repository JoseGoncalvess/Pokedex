import 'package:flutter/material.dart';
import 'package:pokedexx/model/pokev2model.dart';
import '../theme/backgroud_color.dart';

class SecundariinfopokeWidget extends StatefulWidget {
  const SecundariinfopokeWidget(
      {super.key, required this.type, required this.localization});
  final List<Type> type;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(widget.localization,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.w900,
                            color: Backgroud().getBackgroudType(
                                type: widget.type[0].toString()),
                            fontFamily: 'Nunito')),
                  ),
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

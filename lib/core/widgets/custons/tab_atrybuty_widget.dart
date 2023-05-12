import 'package:flutter/material.dart';
import 'package:pokedexx/core/theme/backgroud_color.dart';
import 'package:pokedexx/model/pokev2model.dart';
import '../atribut_type_widget.dart';

class TabAtrybutyWidget extends StatefulWidget {
  final List<Type> types;
  final List<String> vantagem;
  final List<String> desvantagem;

  const TabAtrybutyWidget(
      {Key? key,
      required this.types,
      required this.vantagem,
      required this.desvantagem})
      : super(key: key);

  @override
  State<TabAtrybutyWidget> createState() => _TabAtrybutyWidgetState();
}

class _TabAtrybutyWidgetState extends State<TabAtrybutyWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController _tabcontroller = TabController(length: 2, vsync: this);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.20,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.09,
            child: TabBar(
                controller: _tabcontroller,
                labelColor: Backgroud()
                    .getBackgroudColor(type: widget.types[0].type.name),
                tabs: const [
                  Tab(
                    text: 'Vantagem',
                  ),
                  Tab(
                    text: 'Desvantagem',
                  )
                ]),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            child: TabBarView(controller: _tabcontroller, children: [
              Tab(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.vantagem.length,
                  itemBuilder: (context, index) =>
                      AtributTypeWidget(typename: widget.vantagem[index]),
                ),
              ),
              Tab(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.desvantagem.length,
                  itemBuilder: (context, index) =>
                      AtributTypeWidget(typename: widget.desvantagem[index]),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokedexx/core/theme/backgroud_color.dart';
import 'package:pokedexx/model/pokev2model.dart';
import '../../atribut_type_widget.dart';

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
  late TabController _tabcontroller;
  @override
  void initState() {
    _tabcontroller = TabController(length: 2, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final TabController _tabcontroller = TabController(length: 2, vsync: this);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            child: TabBar(
                unselectedLabelColor: Colors.grey,
                indicatorColor: Backgroud().getBackgroudColor(
                    type: widget.types[0].type.name.toString()),
                labelColor: Backgroud().getBackgroudColor(
                    type: widget.types[0].type.name.toString()),
                labelStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    fontWeight: FontWeight.w900,
                    color: Backgroud().getBackgroudColor(
                        type: widget.types[0].type.name.toString()),
                    fontFamily: 'Nunito'),
                controller: _tabcontroller,
                tabs: const [
                  Tab(
                    text: 'Vantagem',
                  ),
                  Tab(
                    text: 'Desvantagem',
                  )
                ]),
          ),
          SizedBox(
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

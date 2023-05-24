import 'package:flutter/material.dart';

class GridViewTreail extends StatefulWidget {
  const GridViewTreail({super.key});

  @override
  State<GridViewTreail> createState() => GridViewTreailState();
}

class GridViewTreailState extends State<GridViewTreail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text("GirdView"),
      ),
      body: GridView.custom(
        padding: EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2.8),
        childrenDelegate: SliverChildListDelegate([
          Container(
            color: Colors.amberAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [Text("service")],
                ),
              ],
            ),
          ),
          Container(
            color: Color.fromARGB(255, 207, 242, 166),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("service data"),
              ],
            ),
          ),
          Container(
            color: Color.fromARGB(255, 251, 221, 111),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        constraints: const BoxConstraints(),
                        onPressed: () {},
                        icon: Icon(
                          Icons.mode_edit_outline,
                          size: 22,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

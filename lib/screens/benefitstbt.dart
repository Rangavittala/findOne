import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musopathy/models/mtbt.dart';
import 'package:musopathy/widgets/custom_drawer.dart';

class Benefits extends StatelessWidget {
  final List<Mtbt> data = [
    Mtbt(
        """
In the TBT program, inhalation is never sudden, vigorous or very deep. 
1. In most TBT steps, there is no holding of breath involved. 
2. The focus is on controlled exhalation but again based on personal comfort but with the addition of tonation of single frequencies (not dynamic music). 
3. This controlled tonation rids the lungs of stale carbon dioxide accumulated over time and thereby improves inhalation also, enabling fresh Oxygen to get to more remote parts of the lungs, which improves lung health and also decreases risks of infections like Covid. 
4. Tonation is either through closed lips where only the nose is involved (humming) or through pursed lips and puffed cheeks to make it controlled. 
5. Those practising the Musopathy controlled tonation have cleared their respiratory pathways through this self-created vibration in their nasal and throat regions. 
6. Further, nasal tonation has been proved to increase the Nitric Oxide content among participants which has multiple other benefits including vasodilation, improved memory and muscular systems. 
7. Musopathy TBT has also enabled people to combat stress, anxiety, depression and fatigue and increased focus, energy, clarity and decision making abilities.
        """
        ,
        Colors.white),

    // Mtbt(, c),
    // Mtbt(text, c),
    // Mtbt(),
    // Mtbt(, c)
  ];
  final GlobalKey<ScaffoldState> key1 = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      key: key1,
      drawer: CustomDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromRGBO(40, 115, 161, 1.0)),
        backgroundColor: Colors.white,
        title: Text(
          'Principles and Benfits of TBT',
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 20,
            color: Color.fromRGBO(40, 115, 161, 1.0),
            fontWeight: FontWeight.normal,
          ),
        ),
        elevation: 4,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    data[index].text,
                    style: TextStyle(fontSize: 17),
                    textAlign: TextAlign.justify,
                  )),
              color: data[index].c,
            ),
          );
        },
        itemCount: data.length,
      ),
    );
  }
}

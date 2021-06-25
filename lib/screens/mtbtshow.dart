import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musopathy/models/mtbt.dart';
import 'package:musopathy/widgets/custom_drawer.dart';

class Mtbtshow extends StatelessWidget {
  final List<Mtbt> data = [
    Mtbt(
        "Musopathy is the study of the fundamental mechanics of musical impact on different parts of the brain or body of humans, animals, plants and micro entities in a quantifiably precise manner.  Musopathy re-engineers the arena of Music Therapy with its de-regionalised and de-culturalised creations of Clinical Music for more precise studies and is therefore an exciting area with huge therapeutic as well as commercial potential.",
        Colors.white),
    Mtbt(
        "Applied Musopathy offers specially evolved evidence-based Health and Wellness solutions for conditions such as Covid 19, COPD, Stress, Anxiety, Depression, Pain Management etc besides Leadership Training and Team building programs for Corporates such as Tonation Breathing Techniques (TBT).",
        Colors.white),
    Mtbt(
        "Tonation Breathing Techniques (TBT):  TBT is a unique combination of Tonation and evidence-based non-strenuous Breathing and Phonation techniques, innovatively re-engineered, simplified and compiled to give maximum benefits to patients in minimal time. These are anchored on published studies that independently prove the benefits of Phonation, Breathing and sound waves by world class institutions like Harvard and Johns Hopkins.",
        Colors.white),
    Mtbt(
        "Uniqueness \n\nOptimal benefits:  Many programs focus on Breathing techniques and some on Phonation (Humming). By uniquely combining three components - Breathing, Tonation and Phonation, the Musopathy TBT program gives multiple benefits to patients as well as healthy participants to prevent Covid.\n\n Simplified: TBT includes only the easiest techniques and simplifications of even seemingly challenging ones from other programs to not tax even the severely weakened. Variations: Several variations have been introduced to provide higher benefits by engaging more of the respiratory pathways.\n\n Minimalistic approach: There are many Social Media videos with wrong or even harmful techniques for people with specific conditions.  TBT eliminates non-beneficial and anti-beneficial techniques completely.\nFocus: The TBT twin mantra of Mindfulness and Restfulness is life enhancing and - at times, life saving. \n ",
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
          'M U S O P A T H Y',
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
                  child: Text(data[index].text,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 17))),
              color: data[index].c,
            ),
          );
        },
        itemCount: data.length,
      ),
    );
  }
}

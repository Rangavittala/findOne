import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musopathy/models/mtbt.dart';
import 'package:musopathy/widgets/custom_drawer.dart';

class AboutUs extends StatelessWidget {
  final List<Mtbt> data = [
    Mtbt(
        "Musopathy Foundation is a unit of Ravikiran Foundation of India, a registered tax exempt non-profit.",
        Colors.white),
    Mtbt(
        "Vision:  Study the fundamental mechanics of musical impact on different parts of the brain or body of humans, animals, plants and micro entities in a de-regionalised, de-culturalised and quantifiably precise manner.",
        Colors.white),
    Mtbt(
        "Mission:  Find Health Solutions for diverse conditions including but not limited to Covid, COPD and ARDS, Sinus, Immunological and Psycho-neurological issues, muscular stress, pain management especially where pharmacological interventions have not succeeded so far or produce side effects and allergic reactions among patients and offer the same to the public at affordable costs.",
        Colors.white),
    Mtbt(
        "Activities: Health and Wellness Solutions such as Mind Engineering and Management (MEM) and Tonation Breathing Techniques (TBT) Courses for individuals and organizations which includes Leadership Training, Creation of Excellence & Team Building.",
        Colors.white),
    Mtbt(
        "The Team\n\nDr Uma Ranjan, Executive Director\nM S and Ph D from IISc, Bangalore with over 30 years of research experience in academics and industry. Her areas of expertise are mathematical modeling, translational research and computational neuroscience. Uma has directed several new product developments successfully.\n\nDr C N Ramchand, Director\nDr Ramchand has a rich background in drug discovery, nanotechnology and nutraceuticals. He has held key leadership roles in Kemin Industries, Sun Pharma, University of Sheffield and Northern General Hospital Sheffield, UK. Dr Ramchand is a visiting professor at  Swineburne University, Australia and CEO and CSO for over five drug development startups.\n\nDr Eswar Krishnan\nDr Eswar Krishnan, a degree holder from the University of Kerala Medical College, is a physician-scientist specializing in treatment of arthritis and autoimmune diseases based in Indianapolis, Indiana.He is a drug development leader for the multinational company, Eli Lilly.\n\nChitravina N Ravikiran, Specialist Consultant\nA trend setter from age two, Ravikiran (www.ravikiranmusic.com) has been hailed by the world media as “The Mozart of Indian music” (Belgium TV) and enthralled record audiences with his “Teasing precision and dazzling effects” (New York Times).  Youngest to win the President of India’s Senior SNA Award for artistic excellence, Ravikiran is the inventor of Melharmony in world music and initiator of Musopathy.\n",
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
          'About Us',
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

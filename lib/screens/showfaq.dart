import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:musopathy/models/faqdata.dart';
import 'package:musopathy/screens/faq.dart';
import 'package:musopathy/widgets/custom_drawer.dart';

class ShowFaq extends StatelessWidget {
  final List<Entry> data = <Entry>[
    Entry("What is Covid Literacy and why is it important? ", <Entry>[
      Entry(
          "There is a bombardment of information, misinformation and even disinformation from multiple sources regarding Covid, leading to massive levels of confusion among even highly educated people, let alone the less educated ones.  Consequently, tens of  millions end up choosing to not get tested or vaccinated and millions to go to hospitals when not necessary. A huge number of people lose their health - or even lives - because they did not get treated on time. Covid Literacy is a must as people need to be constantly educated to discern between reliable and unreliable information so that they can take the best informed decisions possible in their own interests and that of those around them. "),
    ]),
    Entry("Can I manage Covid at home? ", <Entry>[
      Entry(
          "There is a lot of reliable information on how to manage Covid at home by organisations of impeccable credentials such as WHO, CDC, various Governments or leaders of the medical industry. Please only refer to such sources and follow the protocols exactly as recommended. You can supplement these with well researched breathing or other exercise programs such as Musopathy program. "),
    ]),
    Entry("Why is this App useful?", <Entry>[
      Entry(
          "The Musopathy Covi Sup App provides a phenomenal, power packed program to mitigate the incalculable havoc caused by the Covid pandemic, based on a unique blend of Breathing and Tonation techniques. This is a most important supplement to standard Allopathic treatment as it offers numerous benefits proven by scientific research by top institutions in the   world. "),
    ]),
    Entry("What are the essential components of Musopathy for COVID? ", <Entry>[
      Entry(
          " Musopathy re-engineers scientifically proven mindful breathing with unique tonation techniques which also includes phonation (humming). "),
    ]),
    Entry(
        "What is the connection between breathing exercises and Covid prevention or symptom alleviation? ",
        <Entry>[
          Entry(
              "Studies have shown that breathing right will \n (a) get oxygen deep into the lungs, which helps clear out mucus and other fluids \n (b) reduce chances of infections such as Covid \n (c) strengthen the diaphragm, a major respiratory muscle located under the lungs \n (d) help increase respiratory capacity and oxygen saturation in the blood, and also \n (e) alleviate anxiety and stress."),
        ]),
    Entry("What is Tonation? ", <Entry>[
      Entry(
          "Tonation in the context of Musopathy is about exhaling with diverse frequencies and various tonal textures through the mouth as well as the nose. The latter alone is usually referred to as phonation or humming.  But Musopathy uses Tonation in a comprehensive and holistic term and leverages on it for optimal benefits to the participants. This Tonation technique embedded in Musopathy not only leverages on the frequency produced by the person but can relax one and reduce anxiety and stress. "),
    ]),
    Entry(
        "Can Musopathy help control falling blood Oxygen (SPO2) levels? ",
        <Entry>[
          Entry(
              "Certain techniques like simply lying in the pronal position - on your chest and stomach - or on the sides, are widely considered to help people with ARDS more than lying flat on the back, as per a study published in the European Respiratory Journal, 2002.  In Musopathy, we also leverage on pronal tonation - breathing out with any sustained tone for potentially higher benefits including reduction of anxiety.  Patients following the Musopathy pronal tonation have been able to increase their SPO2 levels by several points within a short time."),
        ]),
    Entry("Can Musopathy cure Covid? ", <Entry>[
      Entry(
          "Musopathy is a very important non-invasive, non-strenuous and easily accessible supplement to standard clinical care for Covid or other respiratory and mood disorders. It is anchored on published research by world class institutions like Harvard and Johns Hopkins but it is not a substitute for Allopathic Care. However, some of these techniques have improved lung function, increased Oxygen saturation (SPO2) levels, brought down high pulse rates, reduced chest congestion and also enabled many people to feel less anxious and depressed. "),
    ]),
    Entry(
        "Do the Musopathy techniques require me to know, learn or listen to music?",
        <Entry>[
          Entry(
              "No. There is no requirement for participants to know music, yoga or other breathing techniques to derive the benefits of Musopathy solutions."),
        ]),
    Entry("What breathing practices should I avoid during Covid?", <Entry>[
      Entry(
          "It is preferable to avoid breathing in through the mouth. Avoid some of the strenuous breathing exercises of Pranayama Yoga such as Kapalbhati, Moorchha,  Bhastrika and any others  that put too much pressure on your respiratory tract. They may leave you breathless and cause other issues when you are suffering from COVID or in rehab."),
    ]),
    Entry("Am I eligible to take Musopathy  sessions? ", <Entry>[
      Entry(
          "If you are asymptomatic, mildly symptomatic or in post Covid rehab, you definitely can benefit from the Musopathy Tonation program. The program can also enhance the wellness for healthy people."),
    ]),
    Entry("When am I not eligible to take these sessions?", <Entry>[
      Entry(
          "If you have high fever and/or are in need of ICU care, you definitely need to get appropriate treatment before taking Musopathy Sessions. "),
    ]),
    Entry("How is Musopathy different from other breathing programs?", <Entry>[
      Entry(
          "Though the distinctiveness of the Musopathy program is due to: \n (a) Adding Tonation to several techniques to leverage on the benefits of both the sound wave and the vibration generated in the associated parts of the body including respiratory passages \n (b) Selecting the easiest techniques that have benefited millions and re-engineering some at a subtle level  \n (c) Simplifying even intricate techniques to make them more accessible  \n (d) Introducing variations designed to provide targeted benefits  \n (e) Coining across the board user friendly terms  \n (f) Creating a mix of these to ensure that users enjoy the maximum benefits with minimal investment of time and effort by following even a subset of them."),
    ]),
    Entry("What benefits do I derive from these sessions?", <Entry>[
      Entry(
          "The Musopathy power packed program combines several methods within 12-15 mts in a manner designed to provide optimal benefits in the most effortless but effective manner. These include  improved cardio-pulmonary reserve and better management of COPD, improved immune health, increased SPO2 levels, increase in Nitric Oxide production, reduction of anxiety and depression, increased focus, clarity, energy and stamina, mental relaxation, enhanced focus, enhanced memory, improved decision making ability vital to top level management and clarity of thought and expression, to name a few."),
    ]),
    Entry("Can I develop adverse symptoms ?", <Entry>[
      Entry(
          "Musopathy does not lead to any adverse symptoms if instructions are followed. Any adverse symptoms could be the result of other conditions. Please consult your doctor in such cases. However, you can stop the exercises of you feel fatigued and try after sometime"),
    ]),
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
          'FAQs',
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
        itemBuilder: (BuildContext context, int index) =>
            EntryItem(data[index]),
            textAlign: TextAlign.justify,
        itemCount: data.length,
      ),
    );
  }
}

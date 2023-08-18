import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../util/banner.dart';
import '../util/doctors.dart';
import '../util/helpers/doctors.dart';
import '../util/helpers/symtomes.dart';
import '../util/helpers/text_helper.dart';
import '../util/symptomes.dart';
import '../util/text.dart';
import 'appointment.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _current_index=0;
  List<SymptomsFigures> sypmtoms = [
    SymptomsFigures(title: "Temperature", type: "🤒"),
    SymptomsFigures(title: "Snuffle", type: "🥺"),
    SymptomsFigures(title: "Headache", type: "🤕"),
    SymptomsFigures(title: "Caught Hou", type: "😷"),
  ];

  List<Doctor> doctorsList = [
    Doctor(name: "Dr Abdullahi", rate: 4.2, position: "Surgery", imagePath: "assets/dr-2.jpg"),
    Doctor(name: "Dr's Nasra", rate: 5.0, position: "Osteopaths", imagePath: "assets/dr-4.jpg"),
    Doctor(name: "Dr Khalid KC", rate: 4.4, position: "Pediatrician", imagePath: "assets/dc-1.jpg"),
    Doctor(name: "Dr Faarah", rate: 3.4, position: "Therapist", imagePath: "assets/dr-3.jpg"),
    Doctor(name: "Dr's Caaliya", rate: 2.8, position: "PlasSurgeons", imagePath: "assets/dr-5.jpg"),
    Doctor(name: "Dr Amiin", rate: 5.4, position: "Rheumatologis", imagePath: "assets/dc-1.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CText(
                    decorations:
                    TextDecorations(fontSize: 25, weight: FontWeight.bold),
                    text: "Abdulrahman 👋",
                  ),
                  const CircleAvatar(
                    minRadius: 10,
                    maxRadius: 30,
                    backgroundImage: AssetImage("assets/cj.png"),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: BannerCard(
                      assetPath: "assets/plus.png",
                      title: "Clinic Vist",
                      subtitle: "Make an appointment",
                      textDecoration:
                      TextDecorations(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: BannerCard(
                      shadows: [
                        BoxShadow(
                          color: Color(0xFFe6e6ea).withOpacity(1),
                          offset: Offset(2, 24),
                          blurRadius: 50,
                          spreadRadius: -5,
                        ),
                      ],
                      bgColor: colors['white-color'],
                      assetPath: "assets/plus.png",
                      title: "Home Vist",
                      subtitle: "Call Home doctor",
                      textDecoration:
                      TextDecorations(color: Colors.black45, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 45,
                left: 10,
              ),
              child: CText(
                  text: "What are your symptoms?",
                  decorations: TextDecorations(
                    fontSize: 24,
                    // weight: FontWeight.bold
                  )),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 10,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.07,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: sypmtoms.length,
                          itemBuilder: (_, i) {
                            var symptomsFigures = sypmtoms[i];
                            return Symptoms(symptomsFigures: symptomsFigures,
                              onTap:(){
                                setState(() {
                                  _current_index=i;
                                });

                              },
                              color: _current_index==i ?colors['primary'] as Color : Color(0xffbdbec6).withOpacity(0.3),
                              forGround: _current_index==i ?colors['white-color'] as Color : null,
                            );
                          },
                          separatorBuilder: (_, index) => SizedBox(
                            width: 5,
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(
                top: 45,
                left: 10,
              ),
              child: CText(
                  text: "Popular Doctors",
                  decorations: TextDecorations(
                    fontSize: 25,

                    // weight: FontWeight.bold
                  )),
            ),
            GridView.builder(
                primary: false,
                itemCount: doctorsList.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 240,
                    mainAxisSpacing: 17

                ),
                itemBuilder: (_, index) {
                  var doctor=doctorsList[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 10,
                        right: 6
                    ),
                    child: OpenContainer(
                      openElevation: 3,
                      openShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      transitionType: ContainerTransitionType.fade,

                      transitionDuration: Duration(seconds: 1),
                      closedBuilder: (content,openCallBack)=>InkWell(
                        onTap: openCallBack,
                        child: DoctorsCard(
                          doctor: doctor,
                        ),
                      ),
                      openBuilder: (context,_)=> Appointment(dr_name: doctor.name, special: doctor.position,
                          image : doctor.imagePath),

                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}

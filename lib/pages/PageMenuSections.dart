import 'package:etno_app/main.dart';
import 'package:etno_app/pages/PageAd.dart';
import 'package:etno_app/pages/PageBandos.dart';
import 'package:etno_app/pages/PageDefunctions.dart';
import 'package:etno_app/pages/PageListReserves.dart';
import 'package:etno_app/pages/incident/PageIncidents.dart';
import 'package:etno_app/pages/PageLinks.dart';
import 'package:etno_app/pages/PageNews.dart';
import 'package:etno_app/pages/PagePharmacies.dart';
import 'package:etno_app/pages/PageServices.dart';
import 'package:etno_app/pages/PageSponsors.dart';
import 'package:etno_app/pages/PageTourism.dart';
import 'package:etno_app/pages/event/PageEvents.dart';
import 'package:etno_app/pages/gallery/PageGallery.dart';
import 'package:etno_app/pages/quiz/PageQuiz.dart';
import 'package:etno_app/store/section.dart';
import 'package:etno_app/widgets/appbar_navigation.dart';
import 'package:etno_app/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../models/section_details/SectionDetails.dart';
import 'equipment/PageEnseresForm.dart';

class PageMenuSections extends StatefulWidget {
  const PageMenuSections({super.key});

  @override
  State<StatefulWidget> createState() {
      return PageState();
  }
}

class PageState extends State<PageMenuSections> {
  SectionDetails sectionDetails = SectionDetails.empty();
  final sectionStore = Section();
  final Section section = Section();
  int bottomIndex = 3;

  @override
  void initState() {
      section
          .getSectionDetails('Bolea')
          .then((value) => setState(() => sectionDetails = value)
      );
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: Colors.white,
          appBar: appBarCustom('Menú', Icons.language, () => print('Internalization in Menu'), null),
          body: SafeArea(
            child: Container(
               // decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/Bolea.png'))),
                padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                child: Column(
                  children: [
                    Expanded(child: Observer(builder: (context) => GridView.count(
                        crossAxisCount: 3,
                        children: sectionStore.getSections.map((e) =>
                            Center(
                                child: SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: InkWell(
                                    onTap: () {
                                      switch(e.title){
                                        case 'Eventos': Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => const PageEvents(), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero)); break;
                                        case 'Turismo': Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => const PageTourism(), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero)); break;
                                        case 'Farmacias': Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => const PagePharmacies(), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero)); break;
                                        case 'Anuncios': Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => const PageAd(), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero)); break;
                                        case 'Noticias': Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => const PageNews(), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero)); break;
                                        case 'Galería': Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => const PageGallery(), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero)); break;
                                        case 'Enlaces': Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => const PageLinks(), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero)); break;
                                        case 'Defunciones': Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => const PageDefunctions(), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero)); break;
                                        case 'Servicios': Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => const PageServices(), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero)); break;
                                        case 'Patrocinadores': Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => const PageSponsors(), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero)); break;
                                        case 'Bandos': Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => const PageBandos(), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero)); break;
                                        case 'Incidentes': Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => const PageIncidents(), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero)); break;
                                        case 'Reservas': Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => const PageListReserves(), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero)); break;
                                        case 'Retirada de Enseres': Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => const PageEnseres(), reverseTransitionDuration: Duration.zero, transitionDuration: Duration.zero)); break;
                                        case 'Yo decido': Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => const PageQuiz(), reverseTransitionDuration: Duration.zero, transitionDuration: Duration.zero)); break;
                                      }
                                    },
                                    child: Card(
                                      color: Colors.white,
                                      elevation: 1.0,
                                      shadowColor: Colors.grey,
                                      child: Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(e.assetImage!, width: 30.0, height: 30.0),
                                              Text(e.title!, style: const TextStyle( fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.black)),
                                              renderTextSection(e.title!, sectionDetails)
                                            ]
                                          )
                                      ),
                                    ),
                                  ),
                                )
                            )
                        ).toList()
                    )
                    ))
                  ],
                )
            ),
          ),
          bottomNavigationBar: bottomNavigation(context, 3)
    );
  }
}

Widget renderTextSection(String sectionName, SectionDetails sectionDetails) {
  switch (sectionName) {
    case 'Eventos':
      return sectionDetails.eventQuantity == null
          ? const SizedBox(
          width: 10.0, height: 10.0, child: CircularProgressIndicator())
          : Text('${sectionDetails.eventQuantity} eventos',
          style: const TextStyle(color: Colors.blue, fontSize: 10.0));
    case 'Turismo':
      return sectionDetails.tourismQuantity == null
          ? const SizedBox(
          width: 10.0, height: 10.0, child: CircularProgressIndicator())
          : Text('${sectionDetails.tourismQuantity} lugares turisticos',
          style: const TextStyle(color: Colors.blue, fontSize: 10.0));
    case 'Farmacias':
      return sectionDetails.pharmacyQuantity == null
          ? const SizedBox(
          width: 10.0, height: 10.0, child: CircularProgressIndicator())
          : Text('${sectionDetails.pharmacyQuantity} farmacias',
          style: const TextStyle(color: Colors.blue, fontSize: 10.0));
    case 'Anuncios':
      return sectionDetails.adQuantity == null
          ? const SizedBox(
          width: 10.0, height: 10.0, child: CircularProgressIndicator())
          : Text('${sectionDetails.adQuantity} anuncios',
          style: const TextStyle(color: Colors.blue, fontSize: 10.0));
    case 'Noticias':
      return sectionDetails.newsQuantity == null
          ? const SizedBox(
          width: 10.0, height: 10.0, child: CircularProgressIndicator())
          : Text('${sectionDetails.newsQuantity} noticias',
          style: const TextStyle(color: Colors.blue, fontSize: 10.0));
    case 'Galería':
      return sectionDetails.galleryQuantity == null
          ? const SizedBox(
          width: 10.0, height: 10.0, child: CircularProgressIndicator())
          : Text('${sectionDetails.galleryQuantity} photos',
          style: const TextStyle(color: Colors.blue, fontSize: 10.0));
    case 'Enlaces':
      return sectionDetails.linkQuantity == null
          ? const SizedBox(
          width: 10.0, height: 10.0, child: CircularProgressIndicator())
          : Text('${sectionDetails.linkQuantity} enlaces',
          style: const TextStyle(color: Colors.blue, fontSize: 10.0));
    case 'Defunciones':
      return sectionDetails.deathQuantity == null
          ? const SizedBox(
          width: 10.0, height: 10.0, child: CircularProgressIndicator())
          : Text('${sectionDetails.deathQuantity} defunciones',
          style: const TextStyle(color: Colors.blue, fontSize: 10.0));
    case 'Servicios':
      return sectionDetails.serviceQuantity == null
          ? const SizedBox(
          width: 10.0, height: 10.0, child: CircularProgressIndicator())
          : Text('${sectionDetails.serviceQuantity} servicios',
          style: const TextStyle(color: Colors.blue, fontSize: 10.0));
    case 'Patrocinadores':
      return sectionDetails.sponsorQuantity == null
          ? const SizedBox(
          width: 10.0, height: 10.0, child: CircularProgressIndicator())
          : Text('${sectionDetails.sponsorQuantity} patrocinadores',
          style: const TextStyle(color: Colors.blue, fontSize: 10.0));
    case 'Bandos':
      return sectionDetails.bandoQuantity == null
          ? const SizedBox(
          width: 10.0, height: 10.0, child: CircularProgressIndicator())
          : Text('${sectionDetails.bandoQuantity} bandos',
          style: const TextStyle(color: Colors.blue, fontSize: 10.0));
    case 'Incidentes':
      return sectionDetails.incidentQuantity == null
          ? const SizedBox(
          width: 10.0, height: 10.0, child: CircularProgressIndicator())
          : Text('${sectionDetails.incidentQuantity} incidentes',
          style: const TextStyle(color: Colors.blue, fontSize: 10.0));
    case 'Reservas':
      return sectionDetails.reserveQuantity == null
          ? const SizedBox(
          width: 10.0, height: 10.0, child: CircularProgressIndicator())
          : Text('${sectionDetails.reserveQuantity} reservas',
          style: const TextStyle(color: Colors.blue, fontSize: 10.0));
    case 'Retirada de Enseres':
      return const Text('Enviar aviso de enser',
          style: TextStyle(color: Colors.blue, fontSize: 10.0));

    case 'Yo decido':
      return const Text('Encuesta', style: TextStyle(color: Colors.blue, fontSize: 10.0));
    default:
      return const Text('Link Personalizado', style: TextStyle(color: Colors.blue, fontSize: 10.0));
  }
}
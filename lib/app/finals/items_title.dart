import 'package:flutter/material.dart';
import 'package:responsive_app/app/ui/pages/about_view.dart';
import 'package:responsive_app/app/ui/pages/events_view.dart';
import 'package:responsive_app/app/ui/pages/extension_view.dart';
import 'package:responsive_app/app/ui/pages/information_view.dart';
import 'package:responsive_app/app/ui/pages/kick-off_view.dart';
import 'package:responsive_app/app/ui/pages/racing_view.dart';

import '../models/models_for_list.dart';

final itemOnList = [
  ModelListTema(
    id: 0,
    title: 'Inicio',
    icon: Icons.adobe_rounded,
    subtitle: [],
    screens: const KickOffView(),
  ),
  ModelListTema(
    id: 1,
    title: 'Eventos',
    icon: Icons.celebration_rounded,
    subtitle: [],
    screens: const EventsView(),
  ),
  ModelListTema(
    id: 2,
    title: 'Carreras',
    icon: Icons.dashboard_customize_rounded,
    subtitle: [
      'Administración de Empresas',
      'Administración de Redes y Comunicaciones',
      'Secretariado Ejecutivo Computarizado',
    ],
    screens: const RacingView(),
  ),
  ModelListTema(
    id: 3,
    title: 'Extención',
    icon: Icons.extension_rounded,
    subtitle: [
      'Curso de Inglés',
      'Cursos básicos de computación',
    ],
    screens: const ExtensionView(),
  ),
  ModelListTema(
    id: 4,
    title: 'Información',
    icon: Icons.fact_check_rounded,
    subtitle: [
      'Egresados',
      'Estudiantes',
      'Postulantes',
      'Bolsa de trabajo',
      'Bienestar estudiantil',
      'Registros académicos',
      'Manual del usuario',
    ],
    screens: const InformationView(),
  ),
  ModelListTema(
    id: 6,
    title: 'Nosotros',
    icon: Icons.info_rounded,
    subtitle: [],
    screens: const AboutView(),
  ),
];

final presentation = [
  PresentationAS(
    title: 'American System',
    subtitle: 'Instituto de Educación Superior Tecnológico Privado I.E.S.T.P',
  )
];

class MenuItems {
  static const List<MenuItem> itemsFirst = [
    itemAlumnos,
    itemAdministrativo,
    itemsDocente
  ];
  static const List<MenuItem> itemsSeconds = [itemSettings];

  static const itemAlumnos = MenuItem(
    title: 'Alumno',
    icon: Icons.face_rounded,
  );
  static const itemsDocente = MenuItem(
    title: 'Docente',
    icon: Icons.person_rounded,
  );
  static const itemAdministrativo = MenuItem(
    title: 'Administrativo',
    icon: Icons.admin_panel_settings_rounded,
  );
  static const itemSettings = MenuItem(
    title: 'Ajustes',
    icon: Icons.settings,
  );
}

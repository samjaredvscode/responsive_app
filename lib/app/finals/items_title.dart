import 'package:flutter/material.dart';
import 'package:responsive_app/app/ui/about_view.dart';
import 'package:responsive_app/app/ui/events_view.dart';
import 'package:responsive_app/app/ui/extension_view.dart';
import 'package:responsive_app/app/ui/information_view.dart';
import 'package:responsive_app/app/ui/intranet_view.dart';
import 'package:responsive_app/app/ui/kick-off_view.dart';
import 'package:responsive_app/app/ui/racing_view.dart';

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
    id: 5,
    title: 'Intranet',
    icon: Icons.group_work_rounded,
    subtitle: [
      'Alumnos',
      'Administrativo',
      'Docentes',
    ],
    screens: const IntranetView(),
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

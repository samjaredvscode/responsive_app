import 'package:flutter/material.dart';

import '../models/models_for_list.dart';

final List<ModelListTema> temaList = [
  ModelListTema(
    title: 'Inicio',
    icon: const Icon(Icons.adobe_rounded),
  ),
  ModelListTema(
    title: 'Eventos',
    icon: const Icon(Icons.celebration_rounded),
  ),
  ModelListTema(
    title: 'Carreras',
    icon: const Icon(Icons.dashboard_customize_rounded),
  ),
  ModelListTema(
    title: 'Extención',
    icon: const Icon(Icons.extension_rounded),
  ),
  ModelListTema(
    title: 'Información',
    icon: const Icon(Icons.fact_check_rounded),
  ),
  ModelListTema(
    title: 'Intranet',
    icon: const Icon(Icons.group_work_rounded),
  ),
  ModelListTema(
    title: 'Nosotros',
    icon: const Icon(Icons.info_rounded),
  ),
];

final List<ModelsListCover> cardItems = [
  ModelsListCover(
    id: 1,
    title: 'Most Popular',
    leading: 'This is a popular plant in our store',
    icon: const Icon(Icons.auto_awesome_rounded),
  ),
  ModelsListCover(
    id: 2,
    title: 'Easy care',
    leading: 'This plant is apropiate for beginners',
    icon: const Icon(Icons.assignment_rounded),
  ),
  ModelsListCover(
    id: 3,
    title: 'Faux Available',
    leading: 'Get the same look without the maintenance',
    icon: const Icon(Icons.park_rounded),
  ),
  ModelsListCover(
    id: 4,
    title: 'Better',
    leading: 'Better for you page and home',
    icon: const Icon(Icons.grade),
  ),
];

final List<PresentationAS> presentation = [
  PresentationAS(
    title: 'American System',
    subtitle: 'Instituto de Educación Superior Tecnológico Privado I.E.S.T.P',
  )
];

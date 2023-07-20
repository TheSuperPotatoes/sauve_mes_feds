import 'package:sauve_mes_feds/models/doctor.dart';
import "index.dart";
import "package:sauve_mes_feds/controlleur/index.dart";

final anamneseActuelleMap = AnamaneseActuelle(
    symptomePrincipal: "Douleur lombaire",
    localisation: "A droite",
    qualite: "7/10",
    irradiation: "Fosse droite",
    chronologie: "depuis deux jours",
    variationAuCourtDuTemps: "constant",
    facteursAttenuants: "Après dafalgan",
    facteurDeclanchants: "au mouvement");

final anamnesePersonelleMap = AnamnesePersonelle(
        //Faire une map!
        medicaments: "Pillules",
        alimentation: "Équilibrée",
        sport: "Course",
        tabac: "1 paquet par jour",
        alcool: "1x par semaine",
        drogue: "Aucune",
        sexualite: "Hétéro. 1x par jour",
        travail: "Ne travail pas")
    .dataMap;

//Status

Status casUrgence1 = Status(datas: urgenceData, idCase: 777, idStatus: 777);

var urgenceData = {
  "Abdominal": {
    "signes": [
      {"name": "Lol", "description": "Description de Lol", "isDone": false},
      {"name": "Lol2", "description": "Description de Lol2", "isDone": false},
      {"name": "Lol3", "description": "Description de Lol3", "isDone": false},
      {"name": "Lol4", "description": "Description de Lol4", "isDone": false}
    ]
  },
  "Cardiaque": {
    "signes": [
      {
        "name": "Douleur thoracique",
        "description": "Description de Douleur thoracique",
        "isDone": false
      },
      {
        "name": "Essoufflement",
        "description": "Description de Essoufflement",
        "isDone": false
      },
      {
        "name": "Palpitations",
        "description": "Description de Palpitations",
        "isDone": false
      },
      {
        "name": "Fatigue",
        "description": "Description de Fatigue",
        "isDone": false
      }
    ]
  }
};

//Management
Management urgenceCas1Management = Management(datas: urgenceCas1ManagementData);
var urgenceCas1ManagementData = [
  {"name": "hospitalisation", "isDone": false},
  {
    "name": "possible instauration d'une AB",
    "isDone": false,
  },
  {"name": "Evoque deux diagnostiques différentiels: '1' et 2", "isDone": false}
];

//Examen complementaire

var urgenceExamens = {
  // "Labo": [
  //   {
  //     "FSS": {
  //       "isDone": true,
  //       "results": [
  //         {
  //           "name": "Albumine",
  //           "": {"value": 123, "range": "123-123"},
  //         },
  //         {
  //           "HB": {"value": 432, "range": "123-432"},
  //         },
  //         {
  //           "Test3": {"value": 123, "range": "123-123"},
  //         },
  //       ]
  //     },
  //     "Lipides":{
  //       "isDone": false,
  //       "results":[
  //         {"Lipide"},
  //         {},
  //       ]
  //     }
  //   },
  // ],
  "images": [
    {"name": "Labo", "source": "", "isDone": false},
    {"name": "Radio", "source": "", "isDone": false},
    {"name": "ECG", "source": "", "isDone": false}
  ]
};

//TEMPLATE

//Utilsier le format JSON pour stocker les informations

final antecedantsPersonels = AntecedantsPersonels(
  maladies: ["Fracture du tibia", "Appendicectomie"],
  allergie: ["Aucune allergie"],
);

DoctorCase docteurUrgence1 = DoctorCase(caseId: 1);

PatientOSCE patientUrgence1 = PatientOSCE(
    idCase: 1,
    spectiality: "urgence",
    anamnesePersonelle: anamnesePersonelleMap,
    antecedantsPersonels: antecedantsPersonels.map,
    anamaneseActuelle: anamneseActuelleMap.mapDatas,
    status: casUrgence1,
    exams: urgenceExamens,
    management: urgenceCas1ManagementData,
    resume:
        "Vous êtes Mme Jane Doe, une femme de 42 ans qui se présente à la clinique avec des douleurs lombaires et de la fièvre. Vous présentez ces symptômes depuis deux jours. La douleur est localisée au flanc droit et est associée à des mictions fréquentes et douloureuses et de la fièvre. Vous n'avez pas d'antécédents médicaux significatifs.");

CaseOSCE cas1 = CaseOSCE(
  speciality: "urgence",
  id: 1,
  nameCas: "Une douleure au rein",
  resume:
      "une femme de 42 ans qui se présente à la clinique avec des douleurs lombaires et de la fièvre",
  isExpert: true,
  isDocteur: true,
  isPatient: true,
  isFav: false,
  patientOSCE: patientUrgence1,
);

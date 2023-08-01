import "package:sauve_mes_feds/index/indexModels.dart";

final anamneseActuelleMap = AnamaneseActuelle(
    idCase: 1,
    symptomePrincipal: "Douleur lombaire",
    localisation: "A droite",
    qualite: "7/10",
    irradiation: "Fosse droite",
    chronologie: "depuis deux jours",
    variation: "constant",
    facteursAttenuants: "Après dafalgan",
    facteurDeclanchants: "au mouvement");

final anamnesePersonelleMap = AnamnesePersonelle(
        //Faire une map!
        idCase: 1,
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
  idCase: 1,
  maladies: ["Fracture du tibia", "Appendicectomie"],
  allergie: ["Aucune allergie"],
);

DoctorCase docteurUrgence1 = DoctorCase(
    caseId: 1,
    speciality: "UG",
    intro:
        "Mme Jane Doe, une femme de 42 ans qui se présente à la clinique avec des douleurs lombaires et de la fièvre");

PatientOSCE patientUrgence1 = PatientOSCE(
    idCase: 1,
    spectiality: "UG",
    anamnesePersonelle: anamnesePersonelleMap,
    antecedantsPersonels: antecedantsPersonels.map,
    anamaneseActuelle: anamneseActuelleMap.mapDatas,
    status: casUrgence1,
    exams: urgenceExamens,
    management: urgenceCas1ManagementData,
    resume:
        "Vous êtes Mme Jane Doe, une femme de 42 ans qui se présente à la clinique avec des douleurs lombaires et de la fièvre. Vous présentez ces symptômes depuis deux jours. La douleur est localisée au flanc droit et est associée à des mictions fréquentes et douloureuses et de la fièvre. Vous n'avez pas d'antécédents médicaux significatifs.");

CaseOSCE cas1 = CaseOSCE(
  speciality: "UG",
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

//MCQ
MCQ question1 = MCQ(
    id: 1,
    category: ["RH"],
    questionContent:
        "Une patiente de 27 ans se présente à votre consultation en raison de douleurs apparues au niveau des deux poignets ainsi qu’au niveau du genou gauche. De plus, elle vous rapporte avoir des brûlures mictionnelles depuis 2 semaines environ.A l’examen clinique vous objectivez des articulations tuméfiées, chaudes et douloureuses à la palpation. En outre, vous observez une conjonctivite bilatérale, que la patiente dit avoir remarqué depuis quelques jours également. ",
    difficulty: 0,
    answersContent: {
      "A": "Dosage des anticorps antinucléaires (ANA)",
      "B": "Test",
      "C": "Test",
      "D": "What?"
    },
    answer: ["B"],
    hint:
        "L'apparence systémique de la maladie vous et l’épisode d’infection génital devraient vous aider",
    answersExplain: "Recherche d’MST car arthrite reactive sur MST",
    questionType: "A",
    isFav: false,
    sources: {"Lien": "test", "Lien2": "test2"});

MCQ question2 = MCQ(
    id: 2,
    category: ["UG, UO"],
    questionContent:
        "Un adolescent de 15 ans se présente aux urgences avec une douleur intense, soudaine au niveau des testicules. À l’examen clinique, le testicule est remonté, le scrotum est rouge, tuméfié et douloureux à la palpation. La bandelette urinaire est normale.Quelle est l’attitude à adopter. ",
    difficulty: 0,
    answersContent: {
      "A": "Hospitaliser et suivre l’évolution",
      "B": "RAD avec antalgie ",
      "C": "Garder en observation aux urgences et mettre de la glace",
      "D": "Donner des AB",
      "E": "Explorer chirurgicalement",
    },
    answer: ["E"],
    hint:
        "Il s’agit d’un patient avec une grande suspition de torsion testiculaires, que faire ensuite? ",
    answersExplain:
        "Ce patient présente les signes et symptômes cliniques tyoiques d’une torsion. Son âge (15-25 ans) ainsi qu’une douleure soudaine et intense permet d’orienter le diagnostique et de poser l’indication opératoire, surtout si l’on s’approche des six heures d’ischémie. Si l’on dispose d’un peu plus de marge temporelle, l’écho-Doppler permet d’affiner le diagnostic, mais ne doit pas retarder la prise en charge. De plus elle ne peut pas prétendre être totalement fiable. Le DD est une orchi-epididymite présent avec des symptomes sub-aigues et parfois associés avec de la fièvre. ",
    questionType: "A",
    isFav: false,
    sources: {
      "Revmed":
          "https://www.revmed.ch/revue-medicale-suisse/2011/revue-medicale-suisse-320/torsion-testiculaire-une-urgence-piege",
    });

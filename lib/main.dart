import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const RailwayPrepApp());
}

class RailwayPrepApp extends StatelessWidget {
  const RailwayPrepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Railway Mock Tests',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121826),
        primaryColor: const Color(0xFF1E2638),
        colorScheme: const ColorScheme.dark(
          primary: Colors.blueAccent,
          secondary: Colors.orangeAccent,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

// रेलवे एग्जाम्स की क्रमवार सूची
const List> railwayExams = [
  {
    'name': 'RRB Group D',
    'subtitle': 'Level 1 • Maths, Reasoning, General Science & GK',
  },
  {
    'name': 'RRB NTPC',
    'subtitle': 'CBT 1 & 2 • GK, History, Polity, Geo, Maths & Reasoning',
  },
  {
    'name': 'RRB ALP',
    'subtitle': 'CBT 1 & 2 • Maths, Physics/Chem/Bio, GK & Reasoning',
  },
  {
    'name': 'RRB JE',
    'subtitle': 'Junior Engineer • General Awareness, Science & Basics',
  },
  {
    'name': 'RPF Constable / SI',
    'subtitle': 'RPF • GK, Polity, History, Geo, Maths & Reasoning',
  },
];

// टेस्ट के प्रकार
const List<String> testTypes = [
  'PYQ',
  'Mini Mock',
  'Full Test',
  'GK',
];

// कठिनाई के स्तर (Easy, Medium, Hard)
const List<String> difficultyLevels = [
  'Easy',
  'Medium',
  'Hard',
];

// सब्जेक्ट वाइज सभी टॉपिक (Group D, NTPC और रेलवे परीक्षाओं के अनुसार)
const Map<String, List<String>> subjectTopics = {
  'Maths': [
    'Number System',
    'Percentage',
    'Profit & Loss',
    'Simple Interest (SI)',
    'Compound Interest (CI)',
    'Ratio & Proportion',
    'Time & Work',
    'Time & Distance',
    'LCM & HCF',
    'Mensuration',
    'Algebra',
    'Geometry & Trigonometry',
    'Statistics & Averages',
    'Age, Calendar & Clock',
  ],
  'Reasoning': [
    'Coding-Decoding',
    'Number & Alphabet Series',
    'Analogy & Similarity',
    'Classification (Odd One Out)',
    'Blood Relations',
    'Syllogism',
    'Venn Diagrams',
    'Direction & Distance',
    'Mathematical Operations',
    'Statement - Conclusion & Assumption',
    'Data Interpretation & Sufficiency',
  ],
  'GK': [
    'Physics (फिजिक्स)',
    'Chemistry (केमिस्ट्री)',
    'Biology (बायो)',
    'History (इतिहास)',
    'Polity (पॉलिटी)',
    'Indian Geography (इंडियन जियोग्राफी)',
    'World Geography (वर्ल्ड जियोग्राफी)',
    'Economics (इकोनॉमिक्स)',
    'Environment (एनवायरनमेंट)',
    'Art & Culture (कला संस्कृति)',
    'Hindi (हिंदी)',
    'Static GK & Railways',
  ],
};

// सवाल का मॉडल
class QuestionItem {
  final String exam;
  final String type;     // 'PYQ', 'Mini Mock', 'Full Test', 'GK', 'Practice'
  final String level;    // 'Easy', 'Medium', 'Hard'
  final String setName;  // 'Set 1', 'Set 2', 'Topic Practice'
  final String subject;  // 'Maths', 'Reasoning', 'GK'
  final String topic;
  final String question;
  final List<String> options;
  final int correctIndex;

  const QuestionItem({
    required this.exam,
    required this.type,
    required this.level,
    required this.setName,
    required this.subject,
    this.topic = 'General',
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}

// प्रश्न बैंक (सभी एग्जाम्स में PYQ, Mini Mock, Full Test के Set 1 & Set 2 + Topic-wise Practice)
const List<QuestionItem> sampleQuestions = [
  // =========================================================
  // 1. RRB GROUP D
  // =========================================================
  // PYQ - Set 1 & Set 2 (Easy, Medium, Hard)
  QuestionItem(
    exam: 'RRB Group D',
    type: 'PYQ',
    level: 'Easy',
    setName: 'Set 1',
    subject: 'Maths',
    topic: 'Percentage',
    question: '[Group D PYQ Set 1 - Easy] किसी संख्या का 20% यदि 60 है, तो वह संख्या क्या होगी?',
    options: ['240', '300', '120', '360'],
    correctIndex: 1,
  ),
  QuestionItem(
    exam: 'RRB Group D',
    type: 'PYQ',
    level: 'Easy',
    setName: 'Set 2',
    subject: 'GK',
    topic: 'Physics (फिजिक्स)',
    question: '[Group D PYQ Set 2 - Easy] कार्य (Work) का SI मात्रक क्या है?',
    options: ['न्यूटन', 'जूल', 'वाट', 'पास्कल'],
    correctIndex: 1,
  ),
  QuestionItem(
    exam: 'RRB Group D',
    type: 'PYQ',
    level: 'Medium',
    setName: 'Set 1',
    subject: 'Maths',
    topic: 'Time & Distance',
    question: '[Group D PYQ Set 1 - Medium] एक रेलगाड़ी 72 किमी/घंटा की चाल से चलती है। 15 सेकंड में वह कितनी दूरी तय करेगी?',
    options: ['250 मीटर', '300 मीटर', '360 मीटर', '400 मीटर'],
    correctIndex: 1,
  ),
  QuestionItem(
    exam: 'RRB Group D',
    type: 'PYQ',
    level: 'Medium',
    setName: 'Set 2',
    subject: 'GK',
    topic: 'Chemistry (केमिस्ट्री)',
    question: '[Group D PYQ Set 2 - Medium] आधुनिक आवर्त सारणी में कुल कितने समूह (Groups) हैं?',
    options: ['7', '12', '18', '20'],
    correctIndex: 2,
  ),
  QuestionItem(
    exam: 'RRB Group D',
    type: 'PYQ',
    level: 'Hard',
    setName: 'Set 1',
    subject: 'Maths',
    topic: 'Time & Work',
    question: '[Group D PYQ Set 1 - Hard] A किसी काम को 12 दिन में और B 18 दिन में कर सकता है। वे 4 दिन साथ काम करते हैं, फिर A चला जाता है। बचा काम B कितने दिन में करेगा?',
    options: ['6 दिन', '8 दिन', '9 दिन', '10 दिन'],
    correctIndex: 1,
  ),
  QuestionItem(
    exam: 'RRB Group D',
    type: 'PYQ',
    level: 'Hard',
    setName: 'Set 2',
    subject: 'GK',
    topic: 'Biology (बायो)',
    question: '[Group D PYQ Set 2 - Hard] मानव शरीर में पाचन की प्रक्रिया मुख्य रूप से कहाँ पूर्ण होती है?',
    options: ['आमाशय', 'छोटी आंत', 'बड़ी आंत', 'यकृत'],
    correctIndex: 1,
  ),

  // Mini Mock - Set 1 & Set 2 (Easy, Medium, Hard)
  QuestionItem(
    exam: 'RRB Group D',
    type: 'Mini Mock',
    level: 'Easy',
    setName: 'Set 1',
    subject: 'Maths',
    topic: 'LCM & HCF',
    question: '[Group D Mini Mock Set 1 - Easy] 12, 18 और 24 का LCM क्या है?',
    options: ['48', '72', '36', '96'],
    correctIndex: 1,
  ),
  QuestionItem(
    exam: 'RRB Group D',
    type: 'Mini Mock',
    level: 'Easy',
    setName: 'Set 2',
    subject: 'Reasoning',
    topic: 'Number & Alphabet Series',
    question: '[Group D Mini Mock Set 2 - Easy] श्रृंखला पूरी करें: 5, 10, 20, 40, ?',
    options: ['60', '70', '80', '100'],
    correctIndex: 2,
  ),
  QuestionItem(
    exam: 'RRB Group D',
    type: 'Mini Mock',
    level: 'Medium',
    setName: 'Set 1',
    subject: 'Maths',
    topic: 'Simple Interest (SI)',
    question: '[Group D Mini Mock Set 1 - Medium] ₹2,000 पर 10% वार्षिक दर से 2 वर्ष का साधारण ब्याज कितना होगा?',
    options: ['₹200', '₹400', '₹600', '₹800'],
    correctIndex: 1,
  ),
  QuestionItem(
    exam: 'RRB Group D',
    type: 'Mini Mock',
    level: 'Medium',
    setName: 'Set 2',
    subject: 'Reasoning',
    topic: 'Coding-Decoding',
    question: '[Group D Mini Mock Set 2 - Medium] यदि PEN को QFO लिखा जाए, तो BOOK को क्या लिखा जाएगा?',
    options: ['CPPL', 'CNPL', 'APNJ', 'CQPM'],
    correctIndex: 0,
  ),
  QuestionItem(
    exam: 'RRB Group D',
    type: 'Mini Mock',
    level: 'Hard',
    setName: 'Set 1',
    subject: 'Maths',
    topic: 'Profit & Loss',
    question: '[Group D Mini Mock Set 1 - Hard] एक वस्तु ₹480 में बेचने पर 20% हानि होती है। 20% लाभ के लिए विक्रय मूल्य क्या होगा?',
    options: ['₹600', '₹680', '₹720', '₹750'],
    correctIndex: 2,
  ),
  QuestionItem(
    exam: 'RRB Group D',
    type: 'Mini Mock',
    level: 'Hard',
    setName: 'Set 2',
    subject: 'GK',
    topic: 'Environment (एनवायरनमेंट)',
    question: '[Group D Mini Mock Set 2 - Hard] ओजोन परत वायुमंडल के किस स्तर में पाई जाती है?',
    options: ['क्षोभमंडल', 'समतापमंडल', 'मध्यमंडल', 'आयनमंडल'],
    correctIndex: 1,
  ),

  // Full Test - Set 1 & Set 2 (Easy, Medium, Hard)
  QuestionItem(
    exam: 'RRB Group D',
    type: 'Full Test',
    level: 'Easy',
    setName: 'Set 1',
    subject: 'Maths',
    topic: 'Percentage',
    question: '[Group D Full Test Set 1 - Easy] 500 का 30% कितना होता है?',
    options: ['120', '150', '180', '200'],
    correctIndex: 1,
  ),
  QuestionItem(
    exam: 'RRB Group D',
    type: 'Full Test',
    level: 'Medium',
    setName: 'Set 1',
    subject: 'GK',
    topic: 'Indian Geography (इंडियन जियोग्राफी)',
    question: '[Group D Full Test Set 1 - Medium] भारत की सबसे लंबी नदी कौन-सी है?',
    options: ['यमुना', 'गोदावरी', 'गंगा', 'नर्मदा'],
    correctIndex: 2,
  ),
  QuestionItem(
    exam: 'RRB Group D',
    type: 'Full Test',
    level: 'Hard',
    setName: 'Set 2',
    subject: 'Maths',
    topic: 'Compound Interest (CI)',
    question: '[Group D Full Test Set 2 - Hard] ₹10,000 पर 10% वार्षिक दर से 2 वर्ष का चक्रवृद्धि ब्याज (CI) क्या होगा?',
    options: ['₹2,000', '₹2,100', '₹2,200', '₹2,500'],
    correctIndex: 1,
  ),

  // =========================================================
  // 2. RRB NTPC
  // =========================================================
  QuestionItem(
    exam: 'RRB NTPC',
    type: 'PYQ',
    level: 'Easy',
    setName: 'Set 1',
    subject: 'GK',
    topic: 'Static GK & Railways',
    question: '[NTPC PYQ Set 1 - Easy] रेलवे बजट को आम बजट में किस वर्ष मिलाया गया था?',
    options: ['2015', '2017', '2018', '2016'],
    correctIndex: 1,
  ),
  QuestionItem(
    exam: 'RRB NTPC',
    type: 'PYQ',
    level: 'Medium',
    setName: 'Set 2',
    subject: 'GK',
    topic: 'History (इतिहास)',
    question: '[NTPC PYQ Set 2 - Medium] असहयोग आंदोलन किस वर्ष शुरू किया गया था?',
    options: ['1919', '1920', '1922', '1930'],
    correctIndex: 1,
  ),
  QuestionItem(
    exam: 'RRB NTPC',
    type: 'PYQ',
    level: 'Hard',
    setName: 'Set 1',
    subject: 'GK',
    topic: 'Polity (पॉलिटी)',
    question: '[NTPC PYQ Set 1 - Hard] किस संविधान संशोधन द्वारा मतदान की आयु 21 से 18 वर्ष की गई?',
    options: ['42वां', '44वां', '61वां', '73वां'],
    correctIndex: 2,
  ),
  QuestionItem(
    exam: 'RRB NTPC',
    type: 'Mini Mock',
    level: 'Easy',
    setName: 'Set 1',
    subject: 'GK',
    topic: 'Polity (पॉलिटी)',
    question: '[NTPC Mini Mock Set 1 - Easy] भारत का संविधान कब लागू हुआ था?',
    options: ['15 अगस्त 1947', '26 नवंबर 1949', '26 जनवरी 1950', '2 अक्टूबर 1952'],
    correctIndex: 2,
  ),
  QuestionItem(
    exam: 'RRB NTPC',
    type: 'Mini Mock',
    level: 'Medium',
    setName: 'Set 2',
    subject: 'GK',
    topic: 'Economics (इकोनॉमिक्स)',
    question: '[NTPC Mini Mock Set 2 - Medium] RBI की स्थापना किस वर्ष हुई थी?',
    options: ['1930', '1935', '1947', '1949'],
    correctIndex: 1,
  ),
  QuestionItem(
    exam: 'RRB NTPC',
    type: 'Mini Mock',
    level: 'Hard',
    setName: 'Set 1',
    subject: 'GK',
    topic: 'Art & Culture (कला संस्कृति)',
    question: '[NTPC Mini Mock Set 1 - Hard] बिहू लोक नृत्य किस राज्य से संबंधित है?',
    options: ['ओडिशा', 'असम', 'पश्चिम बंगाल', 'मणिपुर'],
    correctIndex: 1,
  ),
  QuestionItem(
    exam: 'RRB NTPC',
    type: 'Full Test',
    level: 'Medium',
    setName: 'Set 1',
    subject: 'GK',
    topic: 'World Geography (वर्ल्ड जियोग्राफी)',
    question: '[NTPC Full Test Set 1 - Medium] विश्व का सबसे बड़ा महाद्वीप कौन-सा है?',
    options: ['अफ्रीका', 'एशिया', 'यूरोप', 'उत्तरी अमेरिका'],
    correctIndex: 1,
  ),
  QuestionItem(
    exam: 'RRB NTPC',
    type: 'Full Test',
    level: 'Hard',
    setName: 'Set 2',
    subject: 'Maths',
    topic: 'Algebra',
    question: '[NTPC Full Test Set 2 - Hard] यदि x + 1/x = 4 है, तो x² + 1/x² का मान क्या है?',
    options: ['12', '14', '16', '18'],
    correctIndex: 1,
  ),

  // =========================================================
  // 3. RRB ALP
  // =========================================================
  QuestionItem(
    exam: 'RRB ALP',
    type: 'PYQ',
    level: 'Easy',
    setName: 'Set 1',
    subject: 'GK',
    topic: 'Physics (फिजिक्स)',
    question: '[ALP PYQ Set 1 - Easy] प्रकाश वर्ष (Light Year) किसका मात्रक है?',
    options: ['समय', 'प्रकाश की तीव्रता', 'दूरी', 'वेग'],
    correctIndex: 2,
  ),
  QuestionItem(
    exam: 'RRB ALP',
    type: 'PYQ',
    level: 'Medium',
    setName: 'Set 2',
    subject: 'Maths',
    topic: 'Time & Distance',
    question: '[ALP PYQ Set 2 - Medium] यदि कोई कार 180 किमी की दूरी 3 घंटे में तय करती है, तो चाल क्या है?',
    options: ['50 किमी/घंटा', '55 किमी/घंटा', '60 किमी/घंटा', '65 किमी/घंटा'],
    correctIndex: 2,
  ),
  QuestionItem(
    exam: 'RRB ALP',
    type: 'Mini Mock',
    level: 'Easy',
    setName: 'Set 1',
    subject: 'Maths',
    topic: 'Number System',
    question: '[ALP Mini Mock Set 1 - Easy] 144 का वर्गमूल क्या होता है?',
    options: ['11', '12', '13', '14'],
    correctIndex: 1,
  ),
  QuestionItem(
    exam: 'RRB ALP',
    type: 'Mini Mock',
    level: 'Hard',
    setName: 'Set 2',
    subject: 'Maths',
    topic: 'Geometry & Trigonometry',
    question: '[ALP Mini Mock Set 2 - Hard] यदि sin θ = 3/5 है, तो cos θ का मान क्या होगा?',
    options: ['4/5', '3/4', '5/4', '1/5'],
    correctIndex: 0,
  ),
  QuestionItem(
    exam: 'RRB ALP',
    type: 'Full Test',
    level: 'Medium',
    setName: 'Set 1',
    subject: 'GK',
    topic: 'Physics (फिजिक्स)',
    question: '[ALP Full Test Set 1 - Medium] विद्युत धारा का SI मात्रक क्या है?',
    options: ['वोल्ट', 'ओम', 'एम्पीयर', 'वाट'],
    correctIndex: 2,
  ),
  QuestionItem(
    exam: 'RRB ALP',
    type: 'Full Test',
    level: 'Hard',
    setName: 'Set 2',
    subject: 'GK',
    topic: 'Chemistry (केमिस्ट्री)',
    question: '[ALP Full Test Set 2 - Hard] जल का pH मान (सामान्य स्थिति में) लगभग कितना होता है?',
    options: ['5', '7', '9', '11'],
    correctIndex: 1,
  ),

  // =========================================================
  // 4. RRB JE
  // =========================================================
  QuestionItem(
    exam: 'RRB JE',
    type: 'PYQ',
    level: 'Easy',
    setName: 'Set 1',
    subject: 'Maths',
    topic: 'Mensuration',
    question: '[JE PYQ Set 1 - Easy] एक वर्ग की भुजा 12 सेमी है। इसका क्षेत्रफल कितना होगा?',
    options: ['48 वर्ग सेमी', '144 वर्ग सेमी', '24 वर्ग सेमी', '96 वर्ग सेमी'],
    correctIndex: 1,
  ),
  QuestionItem(
    exam: 'RRB JE',
    type: 'PYQ',
    level: 'Medium',
    setName: 'Set 2',
    subject: 'GK',
    topic: 'Indian Geography (इंडियन जियोग्राफी)',
    question: '[JE PYQ Set 2 - Medium] हीराकुंड बांध किस नदी पर स्थित है?',
    options: ['महानदी', 'गोदावरी', 'कृष्णा', 'नर्मदा'],
    correctIndex: 0,
  ),
  QuestionItem(
    exam: 'RRB JE',
    type: 'Mini Mock',
    level: 'Easy',
    setName: 'Set 1',
    subject: 'GK',
    topic: 'Chemistry (केमिस्ट्री)',
    question: '[JE Mini Mock Set 1 - Easy] जल का रासायनिक सूत्र क्या है?',
    options: ['CO2', 'H2O', 'NaCl', 'O2'],
    correctIndex: 1,
  ),
  QuestionItem(
    exam: 'RRB JE',
    type: 'Mini Mock',
    level: 'Hard',
    setName: 'Set 2',
    subject: 'GK',
    topic: 'Polity (पॉलिटी)',
    question: '[JE Mini Mock Set 2 - Hard] CAG (नियंत्रक एवं महालेखा परीक्षक) किस अनुच्छेद से संबंधित है?',
    options: ['अनुच्छेद 148', 'अनुच्छेद 124', 'अनुच्छेद 280', 'अनुच्छेद 324'],
    correctIndex: 0,
  ),
  QuestionItem(
    exam: 'RRB JE',
    type: 'Full Test',
    level: 'Medium',
    setName: 'Set 1',
    subject: 'GK',
    topic: 'History (इतिहास)',
    question: '[JE Full Test Set 1 - Medium] हड़प्पा सभ्यता किस युग से संबंधित थी?',
    options: ['पाषाण युग', 'कांस्य युग', 'लौह युग', 'ताम्र युग'],
    correctIndex: 1,
  ),
  QuestionItem(
    exam: 'RRB JE',
    type: 'Full Test',
    level: 'Hard',
    setName: 'Set 2',
    subject: 'Maths',
    topic: 'Statistics & Averages',
    question: '[JE Full Test Set 2 - Hard] 5 संख्याओं का औसत 20 है। यदि एक संख्या 30 निकाल दी जाए, तो शेष 4 संख्याओं का औसत क्या होगा?',
    options: ['15', '17.5', '18', '19'],
    correctIndex: 1,
  ),

  // =========================================================
  // 5. RPF CONSTABLE / SI
  // =========================================================
  QuestionItem(
    exam: 'RPF Constable / SI',
    type: 'PYQ',
    level: 'Easy',
    setName: 'Set 1',
    subject: 'GK',
    topic: 'Static GK & Railways',
    question: '[RPF PYQ Set 1 - Easy] भारत में पहली रेलगाड़ी किस वर्ष चली थी?',
    options: ['1850', '1853', '1857', '1861'],
    correctIndex: 1,
  ),
  QuestionItem(
    exam: 'RPF Constable / SI',
    type: 'PYQ',
    level: 'Medium',
    setName: 'Set 2',
    subject: 'GK',
    topic: 'Polity (पॉलिटी)',
    question: '[RPF PYQ Set 2 - Medium] भारतीय संविधान में कुल कितनी अनुसूचियाँ हैं?',
    options: ['8', '10', '12', '14'],
    correctIndex: 2,
  ),
  QuestionItem(
    exam: 'RPF Constable / SI',
    type: 'Mini Mock',
    level: 'Easy',
    setName: 'Set 1',
    subject: 'Maths',
    topic: 'Statistics & Averages',
    question: '[RPF Mini Mock Set 1 - Easy] 25, 35 और 45 का औसत क्या है?',
    options: ['30', '35', '40', '25'],
    correctIndex: 1,
  ),
  QuestionItem(
    exam: 'RPF Constable / SI',
    type: 'Mini Mock',
    level: 'Hard',
    setName: 'Set 2',
    subject: 'GK',
    topic: 'Polity (पॉलिटी)',
    question: '[RPF Mini Mock Set 2 - Hard] आपातकाल में कौन-सा मौलिक अधिकार निलंबित नहीं होता है?',
    options: ['अनुच्छेद 19', 'अनुच्छेद 20 और 21', 'अनुच्छेद 14', 'अनुच्छेद 29'],
    correctIndex: 1,
  ),
  QuestionItem(
    exam: 'RPF Constable / SI',
    type: 'Full Test',
    level: 'Medium',
    setName: 'Set 1',
    subject: 'GK',
    topic: 'History (इतिहास)',
    question: '[RPF Full Test Set 1 - Medium] "स्वराज मेरा जन्मसिद्ध अधिकार है" किसने कहा था?',
    options: ['महात्मा गांधी', 'बाल गंगाधर तिलक', 'सुभाष चंद्र बोस', 'भगत सिंह'],
    correctIndex: 1,
  ),
  QuestionItem(
    exam: 'RPF Constable / SI',
    type: 'Full Test',
    level: 'Hard',
    setName: 'Set 2',
    subject: 'GK',
    topic: 'Hindi (हिंदी)',
    question: '[RPF Full Test Set 2 - Hard] "अग्नि" का पर्यायवाची शब्द कौन-सा है?',
    options: ['अनिल', 'पावक', 'वारी', 'नीर'],
    correctIndex: 1,
  ),

  // =========================================================
  // 6. PRACTICE SESSION: TOPIC-WISE SAMPLES
  // =========================================================
  QuestionItem(
    exam: 'All Exams',
    type: 'Practice',
    level: 'Easy',
    setName: 'Topic Practice',
    subject: 'Maths',
    topic: 'Number System',
    question: 'सबसे छोटी अभाज्य संख्या (Prime Number) कौन-सी है?',
    options: ['0', '1', '2', '3'],
    correctIndex: 2,
  ),
  QuestionItem(
    exam: 'All Exams',
    type: 'Practice',
    level: 'Easy',
    setName: 'Topic Practice',
    subject: 'Maths',
    topic: 'Ratio & Proportion',
    question: 'यदि A : B = 2 : 3 और B : C = 4 : 5 है, तो A : B : C क्या होगा?',
    options: ['8 : 12 : 15', '2 : 3 : 5', '4 : 6 : 5', '6 : 12 : 15'],
    correctIndex: 0,
  ),
  QuestionItem(
    exam: 'All Exams',
    type: 'Practice',
    level: 'Easy',
    setName: 'Topic Practice',
    subject: 'Reasoning',
    topic: 'Blood Relations',
    question: 'A, B का भाई है। B, C की बहन है। C, D का पिता है। A का D से क्या संबंध है?',
    options: ['चाचा / मामा', 'भाई', 'पिता', 'दादा'],
    correctIndex: 0,
  ),
  QuestionItem(
    exam: 'All Exams',
    type: 'Practice',
    level: 'Easy',
    setName: 'Topic Practice',
    subject: 'Reasoning',
    topic: 'Syllogism',
    question: 'कथन: सभी कुत्ते जानवर हैं। सभी जानवर जीव हैं। निष्कर्ष: सभी कुत्ते जीव हैं।',
    options: ['सही है', 'गलत है', 'अनिश्चित', 'कोई नहीं'],
    correctIndex: 0,
  ),
  QuestionItem(
    exam: 'All Exams',
    type: 'Practice',
    level: 'Easy',
    setName: 'Topic Practice',
    subject: 'GK',
    topic: 'Biology (बायो)',
    question: 'कोशिका का "पावरहाउस" (Powerhouse of the Cell) किसे कहा जाता है?',
    options: ['राइबोसोम', 'माइटोकॉन्ड्रिया', 'लाइसोसोम', 'केंद्रक'],
    correctIndex: 1,
  ),
  QuestionItem(
    exam: 'All Exams',
    type: 'Practice',
    level: 'Easy',
    setName: 'Topic Practice',
    subject: 'GK',
    topic: 'Hindi (हिंदी)',
    question: '"कमल" का पर्यायवाची शब्द कौन-सा है?',
    options: ['पंकज', 'सलिल', 'अंबुद', 'वायु'],
    correctIndex: 0,
  ),
];

// 1. Login और Skip स्क्रीन
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  void _goToHome(String userName) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainNavigationScreen(userName: userName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton.icon(
                  onPressed: () => _goToHome('Student (Guest)'),
                  icon: const Icon(Icons.arrow_forward, size: 18, color: Colors.orangeAccent),
                  label: const Text(
                    'Skip Login / बगैर लॉगिन के यूज़ करें',
                    style: TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Spacer(),
              const Icon(Icons.train, size: 70, color: Colors.blueAccent),
              const SizedBox(height: 16),
              const Text(
                'Railway Mock Tests',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 8),
              const Text(
                'अपनी रैंक और स्कोर सेव करने के लिए लॉगिन करें',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'आपका नाम (Your Name)',
                  prefixIcon: const Icon(Icons.person_outline),
                  filled: true,
                  fillColor: const Color(0xFF1E2638),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _mobileController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'मोबाइल नंबर (Mobile Number)',
                  prefixIcon: const Icon(Icons.phone_android),
                  filled: true,
                  fillColor: const Color(0xFF1E2638),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  String name = _nameController.text.trim();
                  _goToHome(name.isEmpty ? 'Student' : name);
                },
                child: const Text(
                  'Login & Start Preparation',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

// 2. मुख्य नेविगेशन
class MainNavigationScreen extends StatefulWidget {
  final String userName;
  const MainNavigationScreen({super.key, required this.userName});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const TopicListScreen(subject: 'Maths'),
      TestsTabScreen(userName: widget.userName),
      const TopicListScreen(subject: 'Reasoning'),
      const TopicListScreen(subject: 'GK'),
      const QuickTypeScreen(testType: 'PYQ'),
      const QuickTypeScreen(testType: 'Mini Mock'),
    ];

    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF151C2C),
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calculate_outlined), label: 'Maths'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined), label: 'Exams'),
          BottomNavigationBarItem(icon: Icon(Icons.psychology_outlined), label: 'Reasoning'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), label: 'GK & Sci'),
          BottomNavigationBarItem(icon: Icon(Icons.history_edu_outlined), label: 'PYQ'),
          BottomNavigationBarItem(icon: Icon(Icons.alarm_on_outlined), label: 'Mocks'),
        ],
      ),
    );
  }
}

// 3. मुख्य स्क्रीन: ऊपर Railway Exams और नीचे Subject-wise Practice Session
class TestsTabScreen extends StatelessWidget {
  final String userName;
  const TestsTabScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'RAILWAY EXAMS & PRACTICE',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            Text('Hi, $userName', style: const TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ),
        backgroundColor: const Color(0xFF151C2C),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: const Text('Login', style: TextStyle(color: Colors.orangeAccent, fontSize: 12)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E2638),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('100% Free with Ads 🔓', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 4),
                  Text('एग्जाम चुनें -> PYQ / Mini Mock / Full Test / GK -> Easy, Medium, Hard (Set 1 & Set 2)।', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFFE65100), Color(0xFFFF8F00)]),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [
                  const Text('Remove Ads for 1 Full Year at ₹29', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 4),
                  const Text('Skip Ads and study uninterrupted for 12 months.', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.white70)),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {},
                    child: const Text('GET NO-ADS YEARLY PASS at ₹29/year', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                ],
              ),
            ),

            // ---- सेक्शन 1: RAILWAY EXAMS ----
            const SizedBox(height: 22),
            const Text(
              'Railway Exams (एग्जाम चुनें)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            ...List.generate(railwayExams.length, (index) {
              final exam = railwayExams[index];
              final totalQ = sampleQuestions.where((q) => q.exam == exam['name']).length;

              return Card(
                color: const Color(0xFF1A2130),
                margin: const EdgeInsets.only(bottom: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueAccent.withOpacity(0.2),
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(
                    exam['name']!,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
                  ),
                  subtitle: Text(
                    '${exam['subtitle']} • $totalQ Qs',
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  trailing: const Icon(Icons.chevron_right, color: Colors.orangeAccent),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExamDetailScreen(examName: exam['name']!),
                      ),
                    );
                  },
                ),
              );
            }),

            // ---- सेक्शन 2: PRACTICE SESSION (एग्जाम्स के नीचे Subject-wise & Topic-wise) ----
            const SizedBox(height: 18),
            const Text(
              'Practice Session (Subject-wise & Topic-wise)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
            ),
            const SizedBox(height: 6),
            const Text(
              'Maths, Reasoning और GK/Science के सभी टॉपिक्स अलग-अलग प्रैक्टिस करें:',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 12),

            _buildPracticeSubjectCard(
              context,
              title: 'Maths Practice (All Topics)',
              subtitle: 'Number System, Percentage, Profit & Loss, SI/CI, Ratio, Time & Work, Mensuration, Algebra, Trig & more',
              subjectKey: 'Maths',
              icon: Icons.functions,
            ),
            _buildPracticeSubjectCard(
              context,
              title: 'Reasoning Practice (All Topics)',
              subtitle: 'Coding-Decoding, Series, Analogy, Classification, Blood Relations, Syllogism, Venn, Direction & more',
              subjectKey: 'Reasoning',
              icon: Icons.psychology_outlined,
            ),
            _buildPracticeSubjectCard(
              context,
              title: 'GK & Science Practice (All Subjects & Topics)',
              subtitle: 'Physics, Chemistry, Biology, History, Polity, Indian & World Geography, Economics, Environment, Art & Culture, Hindi',
              subjectKey: 'GK',
              icon: Icons.public,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPracticeSubjectCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String subjectKey,
    required IconData icon,
  }) {
    final topicCount = (subjectTopics[subjectKey] ?? []).length;

    return Card(
      color: const Color(0xFF1E2638),
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.orangeAccent.withOpacity(0.25)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(14),
        leading: CircleAvatar(
          backgroundColor: Colors.orangeAccent.withOpacity(0.2),
          child: Icon(icon, color: Colors.orangeAccent),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            '$subtitle ($topicCount Topics)',
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blueAccent),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TopicListScreen(subject: subjectKey),
            ),
          );
        },
      ),
    );
  }
}

// 4. किसी एग्जाम पर क्लिक करने के बाद: Type -> Level -> Sets (Set 1, Set 2)
class ExamDetailScreen extends StatefulWidget {
  final String examName;
  const ExamDetailScreen({super.key, required this.examName});

  @override
  State<ExamDetailScreen> createState() => _ExamDetailScreenState();
}

class _ExamDetailScreenState extends State<ExamDetailScreen> {
  String _selectedType = 'PYQ';
  String _selectedLevel = 'Easy';

  @override
  Widget build(BuildContext context) {
    final matchingByTypeAndLevel = sampleQuestions
        .where((q) =>
            q.exam == widget.examName &&
            q.type == _selectedType &&
            q.level == _selectedLevel)
        .toList();

    final availableSets = ['Set 1', 'Set 2'];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.examName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF151C2C),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '1. सेक्शन चुनें (PYQ, Mini Mock, Full Test, GK):',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
            ),
            const SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2.3,
              children: testTypes.map((type) {
                final isSelected = _selectedType == type;
                final countForType = sampleQuestions
                    .where((q) => q.exam == widget.examName && q.type == type)
                    .length;

                return InkWell(
                  onTap: () => setState(() => _selectedType = type),
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blueAccent : const Color(0xFF1E2638),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: isSelected ? Colors.white : Colors.white12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(type, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
                        Text('$countForType Questions', style: TextStyle(fontSize: 11, color: isSelected ? Colors.white70 : Colors.grey)),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              '2. लेवल चुनें (Easy / Medium / Hard):',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
            ),
            const SizedBox(height: 10),
            Row(
              children: difficultyLevels.map((lvl) {
                final isSelected = _selectedLevel == lvl;
                final countForLvl = sampleQuestions
                    .where((q) =>
                        q.exam == widget.examName &&
                        q.type == _selectedType &&
                        q.level == lvl)
                    .length;

                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ChoiceChip(
                      label: Text('$lvl ($countForLvl)', style: const TextStyle(fontSize: 12)),
                      selected: isSelected,
                      selectedColor: Colors.orangeAccent,
                      backgroundColor: const Color(0xFF1E2638),
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      onSelected: (_) => setState(() => _selectedLevel = lvl),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 22),
            const Text(
              '3. टेस्ट सेट चुनें (Set 1 & Set 2):',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
            ),
            const SizedBox(height: 10),
            ...availableSets.map((setName) {
              final setQs = matchingByTypeAndLevel.where((q) => q.setName == setName).toList();
              final subjectsText = setQs.isEmpty
                  ? 'जल्द जोड़े जाएंगे'
                  : setQs.map((e) => e.subject).toSet().join(', ');

              return Card(
                color: const Color(0xFF1A2130),
                margin: const EdgeInsets.only(bottom: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  title: Text(
                    '${widget.examName} • $_selectedType ($setName)',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14),
                  ),
                  subtitle: Text(
                    'Level: $_selectedLevel • ${setQs.length} Qs • $subjectsText',
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: setQs.isEmpty ? Colors.grey.shade700 : Colors.green.shade700,
                    ),
                    onPressed: setQs.isEmpty
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizPlayScreen(
                                  title: '${widget.examName} - $_selectedType $setName ($_selectedLevel)',
                                  questions: setQs,
                                ),
                              ),
                            );
                          },
                    child: const Text('Start', style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

// सब्जेक्ट के अंदर सभी टॉपिक्स की सूची
class TopicListScreen extends StatefulWidget {
  final String subject;
  const TopicListScreen({super.key, required this.subject});

  @override
  State<TopicListScreen> createState() => _TopicListScreenState();
}

class _TopicListScreenState extends State<TopicListScreen> {
  String _selectedLevel = 'All';

  @override
  Widget build(BuildContext context) {
    final topics = subjectTopics[widget.subject] ?? ['General'];

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.subject} Topics', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF151C2C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Level चुनें:', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.orangeAccent)),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['All', ...difficultyLevels].map((lvl) {
                  final isSelected = _selectedLevel == lvl;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(lvl),
                      selected: isSelected,
                      selectedColor: Colors.blueAccent,
                      onSelected: (_) => setState(() => _selectedLevel = lvl),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: ListView.builder(
                itemCount: topics.length,
                itemBuilder: (context, index) {
                  final topicName = topics[index];
                  final topicQs = sampleQuestions.where((q) {
                    final matchTopic = q.topic == topicName;
                    if (_selectedLevel == 'All') return matchTopic;
                    return matchTopic && q.level == _selectedLevel;
                  }).toList();

                  return Card(
                    color: const Color(0xFF1A2130),
                    margin: const EdgeInsets.only(bottom: 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueAccent.withOpacity(0.2),
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(
                        topicName,
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14),
                      ),
                      subtitle: Text(
                        'उपलब्ध प्रश्न: ${topicQs.length} • Level: $_selectedLevel',
                        style: const TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: topicQs.isEmpty ? Colors.grey.shade700 : Colors.green.shade700,
                        ),
                        onPressed: topicQs.isEmpty
                            ? null
                            : () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuizPlayScreen(
                                      title: '${widget.subject} - $topicName',
                                      questions: topicQs,
                                    ),
                                  ),
                                );
                              },
                        child: const Text('Practice', style: TextStyle(color: Colors.white, fontSize: 11)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// नीचे के टैब्स से सीधे एग्जाम खोलने की स्क्रीन
class QuickTypeScreen extends StatelessWidget {
  final String testType;
  const QuickTypeScreen({super.key, required this.testType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$testType (All Railway Exams)', style: const TextStyle(fontSize: 16)),
        backgroundColor: const Color(0xFF151C2C),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: railwayExams.length,
        itemBuilder: (context, index) {
          final examName = railwayExams[index]['name']!;
          final count = sampleQuestions
              .where((q) => q.exam == examName && q.type == testType)
              .length;

          return Card(
            color: const Color(0xFF1A2130),
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              title: Text('$examName - $testType', style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('कुल प्रश्न: $count • Easy, Medium, Hard'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.orangeAccent),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExamDetailScreen(examName: examName),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// 5. लाइव मॉक टेस्ट / टॉपिक प्रैक्टिस खेलने की स्क्रीन
class QuizPlayScreen extends StatefulWidget {
  final String title;
  final List<QuestionItem> questions;

  const QuizPlayScreen({super.key, required this.title, required this.questions});

  @override
  State<QuizPlayScreen> createState() => _QuizPlayScreenState();
}

class _QuizPlayScreenState extends State<QuizPlayScreen> {
  int _currentIndex = 0;
  final Map<int, int> _selectedAnswers = {};
  int _secondsLeft = 900; // 15 मिनट
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        setState(() => _secondsLeft--);
      } else {
        _submitQuiz();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _submitQuiz() {
    _timer?.cancel();
    int score = 0;
    for (int i = 0; i < widget.questions.length; i++) {
      if (_selectedAnswers[i] == widget.questions[i].correctIndex) {
        score++;
      }
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E2638),
        title: const Text('Test Result / परिणाम'),
        content: Text(
          'आपका स्कोर: $score / ${widget.questions.length}\nसही उत्तर: $score',
          style: const TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('OK', style: TextStyle(color: Colors.orangeAccent)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.questions[_currentIndex];
    final mins = (_secondsLeft ~/ 60).toString().padLeft(2, '0');
    final secs = (_secondsLeft % 60).toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(fontSize: 13)),
        backgroundColor: const Color(0xFF151C2C),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Text(
                '$mins:$secs',
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.orangeAccent),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'प्रश्न ${_currentIndex + 1} / ${widget.questions.length}  •  ${q.topic} • ${q.level}',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Text(q.question, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ...List.generate(q.options.length, (idx) {
              final isSelected = _selectedAnswers[_currentIndex] == idx;
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected ? Colors.blueAccent : const Color(0xFF1E2638),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(14),
                  ),
                  onPressed: () {
                    setState(() => _selectedAnswers[_currentIndex] = idx);
                  },
                  child: Text(q.options[idx], style: const TextStyle(color: Colors.white)),
                ),
              );
            }),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentIndex > 0)
                  ElevatedButton(
                    onPressed: () => setState(() => _currentIndex--),
                    child: const Text('Previous'),
                  )
                else
                  const SizedBox(),
                if (_currentIndex < widget.questions.length - 1)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                    onPressed: () => setState(() => _currentIndex++),
                    child: const Text('Next', style: TextStyle(color: Colors.white)),
                  )
                else
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: _submitQuiz,
                    child: const Text('Submit Test', style: TextStyle(color: Colors.white)),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

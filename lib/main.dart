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

// सब्जेक्ट वाइज सभी टॉपिक
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

// सवाल का मॉडल (Solution / व्याख्या के साथ)
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
  final String solution;

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
    required this.solution,
  });
}

// प्रश्न बैंक
const List<QuestionItem> sampleQuestions = [
  // =========================================================
  // 1. RRB GROUP D
  // =========================================================
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
    solution: 'माना संख्या = x। प्रश्नानुसार, x का 20% = 60 => (x × 20) / 100 = 60 => x = (60 × 100) / 20 = 300.',
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
    solution: 'कार्य (Work) और ऊर्जा दोनों का SI मात्रक "जूल (Joule)" होता है। बल का मात्रक न्यूटन तथा शक्ति का मात्रक वाट है।',
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
    solution: 'चाल (मी/से में) = 72 × (5/18) = 20 मीटर/सेकंड। दूरी = चाल × समय = 20 × 15 = 300 मीटर।',
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
    solution: 'हेनरी मोज़ले की आधुनिक आवर्त सारणी में 18 ऊर्ध्वाधर स्तंभ (समूह/Groups) तथा 7 क्षैतिज पंक्तियाँ (आवर्त/Periods) होती हैं।',
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
    solution: 'कुल कार्य (12 व 18 का LCM) = 36 इकाई। A की क्षमता = 3 इकाई/दिन, B की क्षमता = 2 इकाई/दिन। 4 दिन में दोनों का काम = 4 × (3+2) = 20 इकाई। शेष काम = 36 - 20 = 16 इकाई। B द्वारा लिया गया समय = 16 / 2 = 8 दिन।',
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
    solution: 'भोजन का पूर्ण पाचन और पचे हुए पोषक तत्वों का अवशोषण मुख्य रूप से छोटी आंत (Small Intestine) में होता है।',
  ),

  // Group D Mini Mock Set 1 & Set 2
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
    solution: '12 = 2² × 3, 18 = 2 × 3², 24 = 2³ × 3। अतः LCM = 2³ × 3² = 8 × 9 = 72.',
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
    solution: 'प्रत्येक पद पिछले पद का दोगुना है: 5×2=10, 10×2=20, 20×2=40, अतः 40×2 = 80.',
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
    solution: 'साधारण ब्याज (SI) = (मूलधन × दर × समय) / 100 = (2000 × 10 × 2) / 100 = ₹400.',
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
    solution: 'प्रत्येक अक्षर में +1 जोड़ा गया है: P+1=Q, E+1=F, N+1=O। इसी प्रकार B+1=C, O+1=P, O+1=P, K+1=L => CPPL.',
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
    solution: '80% का मान = 480 => क्रय मूल्य (100%) = (480 / 80) × 100 = ₹600। 20% लाभ पर विक्रय मूल्य = 600 × (120/100) = ₹720.',
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
    solution: 'ओजोन परत समतापमंडल (Stratosphere) में पाई जाती है, जो सूर्य की हानिकारक पराबैंगनी (UV) किरणों से पृथ्वी की रक्षा करती है।',
  ),

  // Group D Full Test Set 1 & Set 2
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
    solution: '500 × (30 / 100) = 5 × 30 = 150.',
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
    solution: 'गंगा भारत की सबसे लंबी नदी है, जिसकी कुल लंबाई लगभग 2,525 किमी है। दक्षिण भारत की सबसे लंबी नदी गोदावरी है।',
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
    solution: '2 वर्ष का प्रभावी CI% = 10 + 10 + (10×10)/100 = 21%। अतः ब्याज = 10,000 का 21% = ₹2,100.',
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
    solution: '1924 से अलग पेश हो रहे रेल बजट को विवेक देबरॉय समिति की सिफारिश पर वर्ष 2017 में पुनः आम बजट में विलय कर दिया गया।',
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
    solution: 'महात्मा गांधी के नेतृत्व में असहयोग आंदोलन 1 अगस्त 1920 को शुरू हुआ था और चौरी-चौरा घटना (फरवरी 1922) के बाद स्थगित कर दिया गया।',
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
    solution: '61वें संविधान संशोधन अधिनियम (1988, लागू 1989) द्वारा अनुच्छेद 326 में संशोधन करके मतदान की न्यूनतम आयु 21 से घटाकर 18 वर्ष की गई।',
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
    solution: 'संविधान सभा द्वारा 26 नवंबर 1949 को संविधान अपनाया गया तथा 26 जनवरी 1950 को पूर्ण रूप से लागू किया गया।',
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
    solution: 'भारतीय रिज़र्व बैंक (RBI) की स्थापना RBI अधिनियम 1934 के तहत 1 अप्रैल 1935 को हुई थी और इसका राष्ट्रीयकरण 1 जनवरी 1949 को हुआ।',
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
    solution: 'बिहू असम का प्रसिद्ध लोक नृत्य एवं फसल उत्सव है, जो वर्ष में तीन बार (रोंगाली, कोंगाली और भोगाली बिहू) मनाया जाता है।',
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
    solution: 'क्षेत्रफल और जनसंख्या दोनों ही दृष्टि से एशिया विश्व का सबसे बड़ा महाद्वीप है।',
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
    solution: 'सूत्र: यदि x + 1/x = k, तो x² + 1/x² = k² - 2। यहाँ k = 4 => 4² - 2 = 16 - 2 = 14.',
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
    solution: 'निर्वात में प्रकाश द्वारा एक वर्ष में तय की गई दूरी को प्रकाश वर्ष कहते हैं, अतः यह खगोलीय दूरी का मात्रक है।',
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
    solution: 'चाल = कुल दूरी / कुल समय = 180 / 3 = 60 किमी/घंटा।',
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
    solution: '12 × 12 = 144, इसलिए √144 = 12.',
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
    solution: 'समकोण त्रिभुज में लंब = 3, कर्ण = 5 => आधार = √(5² - 3²) = √16 = 4। अतः cos θ = आधार/कर्ण = 4/5.',
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
    solution: 'विद्युत धारा का SI मात्रक एम्पीयर (Ampere) है। विभवांतर का वोल्ट तथा प्रतिरोध का मात्रक ओम होता है।',
  ),
  QuestionItem(
    exam: 'RRB ALP',
    type: 'Full Test',
    level: 'Hard',
    setName: 'Set 2',
    subject: 'GK',
    topic: 'Chemistry (केमिस्ट्री)',
    question: '[ALP Full Test Set 2 - Hard] शुद्ध जल का pH मान लगभग कितना होता है?',
    options: ['5', '7', '9', '11'],
    correctIndex: 1,
    solution: 'शुद्ध जल उदासीन (Neutral) होता है, इसलिए इसका pH मान 7 होता है। 7 से कम अम्लीय तथा 7 से अधिक क्षारीय होता है।',
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
    solution: 'वर्ग का क्षेत्रफल = भुजा² = 12² = 144 वर्ग सेमी।',
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
    solution: 'हीराकुंड बांध ओडिशा राज्य में महानदी पर निर्मित है। यह विश्व के सबसे लंबे मिट्टी के बांधों में से एक है।',
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
    solution: 'जल के एक अणु में हाइड्रोजन के 2 परमाणु और ऑक्सीजन का 1 परमाणु होता है, अतः इसका सूत्र H2O है।',
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
    solution: 'भारतीय संविधान के अनुच्छेद 148 में भारत के नियंत्रक एवं महालेखा परीक्षक (CAG) के पद का प्रावधान है। अनुच्छेद 280 वित्त आयोग तथा 324 निर्वाचन आयोग से संबंधित है।',
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
    solution: 'सिंधु घाटी / हड़प्पा सभ्यता एक कांस्य युगीन (Bronze Age) सभ्यता थी, क्योंकि इस काल में तांबे और टिन को मिलाकर कांसा बनाने की तकनीक विकसित थी।',
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
    solution: '5 संख्याओं का कुल योग = 5 × 20 = 100। 30 निकालने पर शेष योग = 100 - 30 = 70। शेष 4 संख्याओं का औसत = 70 / 4 = 17.5.',
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
    solution: 'भारत में पहली यात्री रेलगाड़ी 16 अप्रैल 1853 को बोरीबंदर (मुंबई) से ठाणे के बीच 34 किमी की दूरी तक चली थी।',
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
    solution: 'मूल संविधान में 8 अनुसूचियाँ थीं, जबकि वर्तमान में संशोधनों के पश्चात कुल 12 अनुसूचियाँ हैं।',
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
    solution: 'औसत = (25 + 35 + 45) / 3 = 105 / 3 = 35.',
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
    solution: '44वें संविधान संशोधन के अनुसार, राष्ट्रीय आपातकाल के दौरान भी अनुच्छेद 20 (अपराधों के लिए दोषसिद्धि से संरक्षण) और अनुच्छेद 21 (प्राण एवं दैहिक स्वतंत्रता) निलंबित नहीं किए जा सकते।',
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
    solution: 'यह प्रसिद्ध नारा लोकमान्य बाल गंगाधर तिलक ने होमरूल आंदोलन के दौरान दिया था।',
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
    solution: '"पावक" अग्नि का पर्यायवाची है। "अनिल" वायु का तथा "वारी" और "नीर" जल के पर्यायवाची शब्द हैं।',
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
    solution: '2 सबसे छोटी अभाज्य संख्या है और यह एकमात्र सम (Even) अभाज्य संख्या भी है। 1 न तो भाज्य है और न ही अभाज्य।',
  ),
  QuestionItem(
    exam: 'All Exams',
    type: 'Practice',
    level: 'Easy',
    setName: 'Topic Practice',
    subject: 'Maths',
    topic: 'Percentage',
    question: '300 का 25% कितना होगा?',
    options: ['65', '75', '80', '90'],
    correctIndex: 1,
    solution: '300 × (25 / 100) = 3 × 25 = 75.',
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
    solution: 'B का मान बराबर करने पर: A : B = (2×4) : (3×4) = 8 : 12 तथा B : C = (4×3) : (5×3) = 12 : 15। अतः A : B : C = 8 : 12 : 15.',
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
    solution: 'A, B और C आपस में भाई-बहन हैं। चूंकि C, D का पिता है, इसलिए पिता का भाई A, D का चाचा लगेगा।',
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
    solution: 'जब सभी कुत्ते जानवरों के भीतर हैं और सभी जानवर जीवों के भीतर हैं, तो सभी कुत्ते निश्चित रूप से जीव होंगे। अतः निष्कर्ष सही है।',
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
    solution: 'माइटोकॉन्ड्रिया में कोशिकीय श्वसन द्वारा ATP के रूप में ऊर्जा का निर्माण होता है, इसलिए इसे कोशिका का पावरहाउस कहते हैं।',
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
    solution: '"पंकज" (कीचड़ में जन्म लेने वाला) कमल का पर्यायवाची है। "सलिल" जल का तथा "अंबुद" बादल का पर्यायवाची है।',
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

  void _goToHome(String userName, bool isGuest) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainNavigationScreen(userName: userName, isGuest: isGuest),
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
                  onPressed: () => _goToHome('Guest User', true),
                  icon: const Icon(Icons.arrow_forward, size: 18, color: Colors.orangeAccent),
                  label: const Text(
                    'Skip Login',
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
                'पूरे टेस्ट एनालिसिस और सॉल्यूशन के लिए लॉगिन करें',
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
                  _goToHome(name.isEmpty ? 'Student' : name, false);
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
  final bool isGuest;
  const MainNavigationScreen({super.key, required this.userName, required this.isGuest});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      TopicListScreen(subject: 'Maths', isGuest: widget.isGuest),
      TestsTabScreen(userName: widget.userName, isGuest: widget.isGuest),
      TopicListScreen(subject: 'Reasoning', isGuest: widget.isGuest),
      TopicListScreen(subject: 'GK', isGuest: widget.isGuest),
      QuickTypeScreen(testType: 'PYQ', isGuest: widget.isGuest),
      QuickTypeScreen(testType: 'Mini Mock', isGuest: widget.isGuest),
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
  final bool isGuest;
  const TestsTabScreen({super.key, required this.userName, required this.isGuest});

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
            Text(
              isGuest ? '$userName (Skip Mode • No Analysis)' : 'Hi, $userName',
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF151C2C),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: Text(
              isGuest ? 'Login' : 'Switch User',
              style: const TextStyle(color: Colors.orangeAccent, fontSize: 12),
            ),
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
                  Text('सभी एग्जाम, टेस्ट और टॉपिक प्रैक्टिस फ्री उपलब्ध हैं। Login करने पर पूरा Analysis और Solution भी मिलेगा।', style: TextStyle(fontSize: 12, color: Colors.grey)),
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
                        builder: (context) => ExamDetailScreen(examName: exam['name']!, isGuest: isGuest),
                      ),
                    );
                  },
                ),
              );
            }),

            // ---- सेक्शन 2: PRACTICE SESSION ----
            const SizedBox(height: 18),
            const Text(
              'Practice Session (Subject-wise & Topic-wise)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
            ),
            const SizedBox(height: 10),
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
              builder: (context) => TopicListScreen(subject: subjectKey, isGuest: isGuest),
            ),
          );
        },
      ),
    );
  }
}

// 4. किसी एग्जाम पर क्लिक करने के बाद: Type -> Level -> Sets
class ExamDetailScreen extends StatefulWidget {
  final String examName;
  final bool isGuest;
  const ExamDetailScreen({super.key, required this.examName, required this.isGuest});

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

    const availableSets = ['Set 1', 'Set 2'];

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
                                  isGuest: widget.isGuest,
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
  final bool isGuest;
  const TopicListScreen({super.key, required this.subject, required this.isGuest});

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
                                      isGuest: widget.isGuest,
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
  final bool isGuest;
  const QuickTypeScreen({super.key, required this.testType, required this.isGuest});

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
                    builder: (context) => ExamDetailScreen(examName: examName, isGuest: isGuest),
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

// 5. लाइव मॉक टेस्ट खेलने की स्क्रीन (Previous + Mark Review + Next और फ़ोन नेविगेशन बटन से सुरक्षित दूरी)
class QuizPlayScreen extends StatefulWidget {
  final String title;
  final List<QuestionItem> questions;
  final bool isGuest;

  const QuizPlayScreen({
    super.key,
    required this.title,
    required this.questions,
    required this.isGuest,
  });

  @override
  State<QuizPlayScreen> createState() => _QuizPlayScreenState();
}

class _QuizPlayScreenState extends State<QuizPlayScreen> {
  int _currentIndex = 0;
  final Map<int, int> _selectedAnswers = {};
  final Set<int> _markedForReview = {};
  int _secondsLeft = 900;
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

  void _toggleMarkReview() {
    setState(() {
      if (_markedForReview.contains(_currentIndex)) {
        _markedForReview.remove(_currentIndex);
      } else {
        _markedForReview.add(_currentIndex);
      }
    });
  }

  void _submitQuiz() {
    _timer?.cancel();
    int correctCount = 0;
    int incorrectCount = 0;

    for (int i = 0; i < widget.questions.length; i++) {
      if (_selectedAnswers.containsKey(i)) {
        if (_selectedAnswers[i] == widget.questions[i].correctIndex) {
          correctCount++;
        } else {
          incorrectCount++;
        }
      }
    }

    final int marks = correctCount;

    if (widget.isGuest) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: const Color(0xFF1E2638),
          title: const Text('Test Result / परिणाम'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Marks (अंक): $marks / ${widget.questions.length}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.orangeAccent)),
              const SizedBox(height: 8),
              Text('Correct (सही): $correctCount', style: const TextStyle(fontSize: 15, color: Colors.greenAccent)),
              const SizedBox(height: 6),
              Text('Incorrect (गलत): $incorrectCount', style: const TextStyle(fontSize: 15, color: Colors.redAccent)),
              const SizedBox(height: 12),
              const Text(
                'पूरा Analysis और Solution देखने के लिए Login करें।',
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
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
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultAnalysisScreen(
            title: widget.title,
            questions: widget.questions,
            selectedAnswers: _selectedAnswers,
            markedForReview: _markedForReview,
            correctCount: correctCount,
            incorrectCount: incorrectCount,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.questions[_currentIndex];
    final isMarked = _markedForReview.contains(_currentIndex);
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'प्रश्न ${_currentIndex + 1} / ${widget.questions.length}  •  ${q.level}',
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  if (isMarked)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.amber),
                      ),
                      child: const Text(
                        'Marked for Review',
                        style: TextStyle(color: Colors.amber, fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
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
            ],
          ),
        ),
      ),
      // फ़ोन के तीन नेविगेशन बटन (Back / Home / Recent) से सुरक्षित दूरी के साथ तीनों टेस्ट बटन
      bottomNavigationBar: SafeArea(
        child: Container(
          color: const Color(0xFF151C2C),
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 24),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _currentIndex > 0 ? const Color(0xFF28334A) : const Color(0xFF1C2333),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: _currentIndex > 0 ? () => setState(() => _currentIndex--) : null,
                  child: const Text('Previous', style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isMarked ? Colors.amber.shade700 : const Color(0xFF3A2E1E),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: _toggleMarkReview,
                  child: Text(
                    isMarked ? 'Unmark' : 'Mark Review',
                    style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _currentIndex < widget.questions.length - 1
                        ? Colors.blueAccent
                        : Colors.green.shade700,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {
                    if (_currentIndex < widget.questions.length - 1) {
                      setState(() => _currentIndex++);
                    } else {
                      _submitQuiz();
                    }
                  },
                  child: Text(
                    _currentIndex < widget.questions.length - 1 ? 'Next' : 'Submit',
                    style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 6. विस्तृत एनालिसिस और सॉल्यूशन स्क्रीन (केवल Login यूज़र्स के लिए)
class ResultAnalysisScreen extends StatelessWidget {
  final String title;
  final List<QuestionItem> questions;
  final Map<int, int> selectedAnswers;
  final Set<int> markedForReview;
  final int correctCount;
  final int incorrectCount;

  const ResultAnalysisScreen({
    super.key,
    required this.title,
    required this.questions,
    required this.selectedAnswers,
    required this.markedForReview,
    required this.correctCount,
    required this.incorrectCount,
  });

  @override
  Widget build(BuildContext context) {
    final int unattempted = questions.length - (correctCount + incorrectCount);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Analysis & Solutions', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF151C2C),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1E2638),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blueAccent.withOpacity(0.4)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatBox('Marks', '$correctCount/${questions.length}', Colors.orangeAccent),
                    _buildStatBox('Correct', '$correctCount', Colors.greenAccent),
                    _buildStatBox('Incorrect', '$incorrectCount', Colors.redAccent),
                    _buildStatBox('Review', '${markedForReview.length}', Colors.amber),
                  ],
                ),
                const SizedBox(height: 6),
                Text('Skipped: $unattempted', style: const TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'प्रश्न-वार एनालिसिस एवं विस्तृत सॉल्यूशन:',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
          ),
          const SizedBox(height: 10),
          ...List.generate(questions.length, (index) {
            final q = questions[index];
            final userChoice = selectedAnswers[index];
            final isSkipped = userChoice == null;
            final isCorrect = userChoice == q.correctIndex;
            final isMarked = markedForReview.contains(index);

            Color statusColor = isSkipped
                ? Colors.grey
                : (isCorrect ? Colors.greenAccent : Colors.redAccent);
            String statusText = isSkipped
                ? 'Skipped (छोड़ा गया)'
                : (isCorrect ? '✔ Correct (सही)' : '✘ Incorrect (गलत)');

            return Card(
              color: const Color(0xFF1A2130),
              margin: const EdgeInsets.only(bottom: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: statusColor.withOpacity(0.35)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'प्रश्न ${index + 1} • ${q.subject}${isMarked ? " • ★ Review" : ""}',
                          style: TextStyle(fontSize: 12, color: isMarked ? Colors.amber : Colors.grey),
                        ),
                        Text(statusText, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: statusColor)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(q.question, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    if (!isSkipped)
                      Text(
                        'आपका उत्तर: ${q.options[userChoice]}',
                        style: TextStyle(fontSize: 13, color: isCorrect ? Colors.greenAccent : Colors.redAccent),
                      ),
                    Text(
                      'सही उत्तर: ${q.options[q.correctIndex]}',
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.greenAccent),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF121826),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Solution / व्याख्या:',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            q.solution,
                            style: const TextStyle(fontSize: 13, color: Colors.white70, height: 1.4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildStatBox(String label, String value, Color color) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }
}

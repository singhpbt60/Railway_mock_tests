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
const List<Map<String, String>> railwayExams = [
  {
    'name': 'RRB Group D',
    'subtitle': 'लेवल 1 • गणित, रीजनिंग, सामान्य विज्ञान व सामान्य ज्ञान',
  },
  {
    'name': 'RRB NTPC',
    'subtitle': 'CBT 1 व 2 • इतिहास, राजव्यवस्था, भूगोल, गणित व रीजनिंग',
  },
  {
    'name': 'RRB ALP',
    'subtitle': 'CBT 1 व 2 • गणित, विज्ञान, सामान्य ज्ञान व रीजनिंग',
  },
  {
    'name': 'RRB JE',
    'subtitle': 'जूनियर इंजीनियर • सामान्य जागरूकता, विज्ञान व मूल विषय',
  },
  {
    'name': 'RPF Constable / SI',
    'subtitle': 'RPF • सामान्य ज्ञान, राजव्यवस्था, इतिहास, गणित व रीजनिंग',
  },
];

// टेस्ट के प्रकार
const List<String> testTypes = [
  'PYQ',
  'Mini Mock',
  'Full Test',
  'GK',
];

// कठिनाई के स्तर
const List<String> difficultyLevels = [
  'Easy',
  'Medium',
  'Hard',
];

// प्रैक्टिस के विषय और उनके हिंदी टॉपिक
const Map<String, List<String>> hindiSubjectTopics = {
  'गणित': [
    'संख्या पद्धति',
    'प्रतिशत',
    'लाभ और हानि',
    'साधारण ब्याज',
    'चक्रवृद्धि ब्याज',
    'अनुपात और समानुपात',
    'समय और कार्य',
    'समय, चाल और दूरी',
    'लघुत्तम और महत्तम (LCM/HCF)',
    'क्षेत्रमिति',
    'बीजगणित',
    'ज्यामिति और त्रिकोणमिति',
    'औसत और सांख्यिकी',
    'आयु, कैलेंडर और घड़ी',
  ],
  'रीजनिंग': [
    'कोडिंग-डिकोडिंग',
    'संख्या और अक्षर श्रृंखला',
    'सादृश्यता',
    'वर्गीकरण',
    'रक्त संबंध',
    'न्याय निगमन',
    'वेन आरेख',
    'दिशा और दूरी',
    'गणितीय संक्रियाएं',
    'कथन और निष्कर्ष',
    'डेटा विश्लेषण',
  ],
  'सामान्य ज्ञान व विज्ञान': [
    'भौतिक विज्ञान',
    'रसायन विज्ञान',
    'जीव विज्ञान',
    'इतिहास',
    'राजव्यवस्था',
    'भारतीय भूगोल',
    'विश्व भूगोल',
    'अर्थशास्त्र',
    'पर्यावरण',
    'कला एवं संस्कृति',
    'हिन्दी',
    'स्थैतिक जीके व रेलवे',
  ],
};

// सवाल का मॉडल
class QuestionItem {
  final String exam;
  final String type;
  final String level;
  final String setName;
  final String subject;
  final String topic;
  final String question;
  final String questionEn;
  final List<String> options;
  final List<String> optionsEn;
  final int correctIndex;
  final String solution;

  const QuestionItem({
    required this.exam,
    required this.type,
    required this.level,
    required this.setName,
    required this.subject,
    this.topic = 'सामान्य',
    required this.question,
    this.questionEn = '',
    required this.options,
    this.optionsEn = const [],
    required this.correctIndex,
    required this.solution,
  });
}

// प्रश्न बैंक
const List<QuestionItem> sampleQuestions = [
  QuestionItem(
    exam: 'RRB Group D',
    type: 'PYQ',
    level: 'Easy',
    setName: 'Set 1',
    subject: 'गणित',
    topic: 'प्रतिशत',
    question: 'किसी संख्या का 20% यदि 60 है, तो वह संख्या क्या होगी?',
    questionEn: 'If 20% of a number is 60, what is that number?',
    options: ['240', '300', '120', '360'],
    optionsEn: ['240', '300', '120', '360'],
    correctIndex: 1,
    solution: 'माना संख्या = x। (x × 20) / 100 = 60 => x = 300.',
  ),
  QuestionItem(
    exam: 'RRB Group D',
    type: 'PYQ',
    level: 'Easy',
    setName: 'Set 2',
    subject: 'सामान्य ज्ञान व विज्ञान',
    topic: 'भौतिक विज्ञान',
    question: 'कार्य का SI मात्रक क्या है?',
    questionEn: 'What is the SI unit of work?',
    options: ['न्यूटन', 'जूल', 'वाट', 'पास्कल'],
    optionsEn: ['Newton', 'Joule', 'Watt', 'Pascal'],
    correctIndex: 1,
    solution: 'कार्य और ऊर्जा का SI मात्रक जूल (Joule) होता है।',
  ),
  QuestionItem(
    exam: 'RRB Group D',
    type: 'Mini Mock',
    level: 'Easy',
    setName: 'Set 1',
    subject: 'गणित',
    topic: 'लघुत्तम और महत्तम (LCM/HCF)',
    question: '12, 18 और 24 का LCM क्या है?',
    questionEn: 'What is the LCM of 12, 18 and 24?',
    options: ['48', '72', '36', '96'],
    optionsEn: ['48', '72', '36', '96'],
    correctIndex: 1,
    solution: '12, 18 और 24 का लघुत्तम समापवर्त्य 72 है।',
  ),
  QuestionItem(
    exam: 'RRB Group D',
    type: 'Mini Mock',
    level: 'Medium',
    setName: 'Set 1',
    subject: 'गणित',
    topic: 'साधारण ब्याज',
    question: '₹2,000 पर 10% वार्षिक दर से 2 वर्ष का साधारण ब्याज कितना होगा?',
    questionEn: 'What is the simple interest on ₹2,000 at 10% per annum for 2 years?',
    options: ['₹200', '₹400', '₹600', '₹800'],
    optionsEn: ['₹200', '₹400', '₹600', '₹800'],
    correctIndex: 1,
    solution: 'SI = (2000 × 10 × 2) / 100 = ₹400.',
  ),
  QuestionItem(
    exam: 'RRB Group D',
    type: 'Mini Mock',
    level: 'Hard',
    setName: 'Set 1',
    subject: 'गणित',
    topic: 'लाभ और हानि',
    question: 'एक वस्तु ₹480 में बेचने पर 20% हानि होती है। 20% लाभ के लिए विक्रय मूल्य क्या होगा?',
    questionEn: 'Selling an article for ₹480 causes a 20% loss. What is the SP for a 20% profit?',
    options: ['₹600', '₹680', '₹720', '₹750'],
    optionsEn: ['₹600', '₹680', '₹720', '₹750'],
    correctIndex: 2,
    solution: 'क्रय मूल्य = 480 × 100 / 80 = ₹600। 20% लाभ पर विक्रय मूल्य = 600 × 120 / 100 = ₹720.',
  ),
  QuestionItem(
    exam: 'RRB NTPC',
    type: 'PYQ',
    level: 'Easy',
    setName: 'Set 1',
    subject: 'सामान्य ज्ञान व विज्ञान',
    topic: 'राजव्यवस्था',
    question: 'भारत का संविधान कब लागू हुआ था?',
    questionEn: 'When did the Constitution of India come into effect?',
    options: ['15 अगस्त 1947', '26 नवंबर 1949', '26 जनवरी 1950', '2 अक्टूबर 1952'],
    optionsEn: ['15 Aug 1947', '26 Nov 1949', '26 Jan 1950', '2 Oct 1952'],
    correctIndex: 2,
    solution: 'भारत का संविधान 26 जनवरी 1950 को लागू हुआ था।',
  ),
  QuestionItem(
    exam: 'RRB ALP',
    type: 'PYQ',
    level: 'Easy',
    setName: 'Set 1',
    subject: 'सामान्य ज्ञान व विज्ञान',
    topic: 'भौतिक विज्ञान',
    question: 'प्रकाश वर्ष किसका मात्रक है?',
    questionEn: 'Light year is a unit of which quantity?',
    options: ['समय', 'प्रकाश की तीव्रता', 'दूरी', 'वेग'],
    optionsEn: ['Time', 'Light Intensity', 'Distance', 'Speed'],
    correctIndex: 2,
    solution: 'प्रकाश वर्ष खगोलीय दूरी का मात्रक है।',
  ),
  QuestionItem(
    exam: 'RRB JE',
    type: 'PYQ',
    level: 'Easy',
    setName: 'Set 1',
    subject: 'सामान्य ज्ञान व विज्ञान',
    topic: 'भारतीय भूगोल',
    question: 'हीराकुंड बांध किस नदी पर स्थित है?',
    questionEn: 'Hirakud Dam is built on which river?',
    options: ['महानदी', 'गोदावरी', 'कृष्णा', 'नर्मदा'],
    optionsEn: ['Mahanadi', 'Godavari', 'Krishna', 'Narmada'],
    correctIndex: 0,
    solution: 'हीराकुंड बांध ओडिशा में महानदी पर स्थित है।',
  ),
  QuestionItem(
    exam: 'RPF Constable / SI',
    type: 'PYQ',
    level: 'Easy',
    setName: 'Set 1',
    subject: 'सामान्य ज्ञान व विज्ञान',
    topic: 'इतिहास',
    question: 'भारत में पहली रेलगाड़ी किस वर्ष चली थी?',
    questionEn: 'In which year did the first train run in India?',
    options: ['1850', '1853', '1857', '1861'],
    optionsEn: ['1850', '1853', '1857', '1861'],
    correctIndex: 1,
    solution: 'भारत में पहली रेलगाड़ी 16 अप्रैल 1853 को मुंबई से ठाणे के बीच चली थी।',
  ),
  QuestionItem(
    exam: 'सभी परीक्षाएं',
    type: 'Practice',
    level: 'Easy',
    setName: 'टॉपिक प्रैक्टिस',
    subject: 'गणित',
    topic: 'संख्या पद्धति',
    question: 'सबसे छोटी अभाज्य संख्या कौन-सी है?',
    questionEn: 'Which is the smallest prime number?',
    options: ['0', '1', '2', '3'],
    optionsEn: ['0', '1', '2', '3'],
    correctIndex: 2,
    solution: '2 सबसे छोटी अभाज्य संख्या है।',
  ),
  QuestionItem(
    exam: 'सभी परीक्षाएं',
    type: 'Practice',
    level: 'Easy',
    setName: 'टॉपिक प्रैक्टिस',
    subject: 'रीजनिंग',
    topic: 'संख्या और अक्षर श्रृंखला',
    question: 'श्रृंखला पूरी करें: 2, 6, 12, 20, 30, ?',
    questionEn: 'Complete the series: 2, 6, 12, 20, 30, ?',
    options: ['36', '40', '42', '48'],
    optionsEn: ['36', '40', '42', '48'],
    correctIndex: 2,
    solution: '+4, +6, +8, +10, +12 का क्रम है => 30 + 12 = 42.',
  ),
  QuestionItem(
    exam: 'सभी परीक्षाएं',
    type: 'Practice',
    level: 'Easy',
    setName: 'टॉपिक प्रैक्टिस',
    subject: 'सामान्य ज्ञान व विज्ञान',
    topic: 'जीव विज्ञान',
    question: 'कोशिका का पावरहाउस किसे कहा जाता है?',
    questionEn: 'Which organelle is known as the powerhouse of the cell?',
    options: ['राइबोसोम', 'माइटोकॉन्ड्रिया', 'लाइसोसोम', 'केंद्रक'],
    optionsEn: ['Ribosome', 'Mitochondria', 'Lysosome', 'Nucleus'],
    correctIndex: 1,
    solution: 'माइटोकॉन्ड्रिया ऊर्जा उत्पन्न करता है, इसलिए इसे पावरहाउस कहते हैं।',
  ),
];

// 1. लॉगिन स्क्रीन
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
                  onPressed: () => _goToHome('अतिथि छात्र', true),
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
                'पूरे एनालिसिस और सॉल्यूशन के लिए लॉगिन करें',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 28),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'आपका नाम',
                  prefixIcon: const Icon(Icons.person_outline),
                  filled: true,
                  fillColor: const Color(0xFF1E2638),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: _mobileController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'मोबाइल नंबर',
                  prefixIcon: const Icon(Icons.phone_android),
                  filled: true,
                  fillColor: const Color(0xFF1E2638),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 22),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  final name = _nameController.text.trim();
                  _goToHome(name.isEmpty ? 'छात्र' : name, false);
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
  bool _isEnglish = false;

  void _toggleLanguage() {
    setState(() => _isEnglish = !_isEnglish);
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      TopicListScreen(subject: 'गणित', isGuest: widget.isGuest, isEnglish: _isEnglish, onToggleLang: _toggleLanguage),
      TestsTabScreen(userName: widget.userName, isGuest: widget.isGuest, isEnglish: _isEnglish, onToggleLang: _toggleLanguage),
      TopicListScreen(subject: 'रीजनिंग', isGuest: widget.isGuest, isEnglish: _isEnglish, onToggleLang: _toggleLanguage),
      TopicListScreen(subject: 'सामान्य ज्ञान व विज्ञान', isGuest: widget.isGuest, isEnglish: _isEnglish, onToggleLang: _toggleLanguage),
      QuickTypeScreen(testType: 'PYQ', isGuest: widget.isGuest, isEnglish: _isEnglish),
      QuickTypeScreen(testType: 'Mini Mock', isGuest: widget.isGuest, isEnglish: _isEnglish),
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
          BottomNavigationBarItem(icon: Icon(Icons.calculate_outlined), label: 'गणित'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined), label: 'परीक्षाएं'),
          BottomNavigationBarItem(icon: Icon(Icons.psychology_outlined), label: 'रीजनिंग'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), label: 'जीके/विज्ञान'),
          BottomNavigationBarItem(icon: Icon(Icons.history_edu_outlined), label: 'PYQ'),
          BottomNavigationBarItem(icon: Icon(Icons.alarm_on_outlined), label: 'मॉक'),
        ],
      ),
    );
  }
}

// 3. मुख्य स्क्रीन: ऊपर रेलवे परीक्षाएं और नीचे हिंदी में विषयवार प्रैक्टिस
class TestsTabScreen extends StatelessWidget {
  final String userName;
  final bool isGuest;
  final bool isEnglish;
  final VoidCallback onToggleLang;

  const TestsTabScreen({
    super.key,
    required this.userName,
    required this.isGuest,
    required this.isEnglish,
    required this.onToggleLang,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'RAILWAY MOCK TESTS',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            Text(
              isGuest ? '$userName (Skip • केवल अंक व सही/गलत)' : 'नमस्ते, $userName',
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF151C2C),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: onToggleLang,
            child: Text(
              isEnglish ? 'हिन्दी' : 'English',
              style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
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
                gradient: const LinearGradient(colors: [Color(0xFFE65100), Color(0xFFFF8F00)]),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [
                  const Text('Remove Ads for 1 Full Year at ₹29', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 4),
                  const Text('12 महीने बिना विज्ञापन के पढ़ाई करें।', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.white70)),
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
            const SizedBox(height: 20),
            const Text('रेलवे परीक्षाएं (एग्जाम चुनें)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 10),
            ...List.generate(railwayExams.length, (index) {
              final exam = railwayExams[index];
              final count = sampleQuestions.where((q) => q.exam == exam['name']).length;
              return Card(
                color: const Color(0xFF1A2130),
                margin: const EdgeInsets.only(bottom: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueAccent.withOpacity(0.2),
                    child: Text('${index + 1}', style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
                  ),
                  title: Text(exam['name']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
                  subtitle: Text('${exam['subtitle']} • $count प्रश्न', style: const TextStyle(fontSize: 11, color: Colors.grey)),
                  trailing: const Icon(Icons.chevron_right, color: Colors.orangeAccent),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExamDetailScreen(examName: exam['name']!, isGuest: isGuest, isEnglish: isEnglish),
                      ),
                    );
                  },
                ),
              );
            }),
            const SizedBox(height: 18),
            const Text('प्रैक्टिस सेशन (विषय व टॉपिक अनुसार)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.orangeAccent)),
            const SizedBox(height: 10),
            ...hindiSubjectTopics.keys.map((subName) {
              final topicsCount = hindiSubjectTopics[subName]!.length;
              return Card(
                color: const Color(0xFF1E2638),
                margin: const EdgeInsets.only(bottom: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  title: Text('$subName प्रैक्टिस', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  subtitle: Text('कुल टॉपिक: $topicsCount', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blueAccent),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TopicListScreen(
                          subject: subName,
                          isGuest: isGuest,
                          isEnglish: isEnglish,
                          onToggleLang: onToggleLang,
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

// 4. एग्जाम के अंदर सेक्शन, लेवल और सेट
class ExamDetailScreen extends StatefulWidget {
  final String examName;
  final bool isGuest;
  final bool isEnglish;
  const ExamDetailScreen({super.key, required this.examName, required this.isGuest, required this.isEnglish});

  @override
  State<ExamDetailScreen> createState() => _ExamDetailScreenState();
}

class _ExamDetailScreenState extends State<ExamDetailScreen> {
  String _selectedType = 'PYQ';
  String _selectedLevel = 'Easy';

  @override
  Widget build(BuildContext context) {
    final matching = sampleQuestions
        .where((q) => q.exam == widget.examName && q.type == _selectedType && q.level == _selectedLevel)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.examName, style: const TextStyle(fontSize: 16)),
        backgroundColor: const Color(0xFF151C2C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('1. सेक्शन चुनें:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orangeAccent)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: testTypes.map((t) {
                return ChoiceChip(
                  label: Text(t),
                  selected: _selectedType == t,
                  selectedColor: Colors.blueAccent,
                  onSelected: (_) => setState(() => _selectedType = t),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Text('2. लेवल चुनें:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orangeAccent)),
            const SizedBox(height: 8),
            Row(
              children: difficultyLevels.map((lvl) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ChoiceChip(
                      label: Text(lvl),
                      selected: _selectedLevel == lvl,
                      selectedColor: Colors.orangeAccent,
                      onSelected: (_) => setState(() => _selectedLevel = lvl),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xFF1A2130), borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${widget.examName} • $_selectedType ($_selectedLevel)', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text('उपलब्ध प्रश्न: ${matching.length}', style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 14),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: matching.isEmpty ? Colors.grey.shade700 : Colors.green.shade700),
                    onPressed: matching.isEmpty
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizPlayScreen(
                                  title: '${widget.examName} - $_selectedType ($_selectedLevel)',
                                  questions: matching,
                                  isGuest: widget.isGuest,
                                  isEnglish: widget.isEnglish,
                                ),
                              ),
                            );
                          },
                    child: const Text('Start Test', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 5. विषय के अंदर हिंदी टॉपिक सूची
class TopicListScreen extends StatelessWidget {
  final String subject;
  final bool isGuest;
  final bool isEnglish;
  final VoidCallback onToggleLang;

  const TopicListScreen({
    super.key,
    required this.subject,
    required this.isGuest,
    required this.isEnglish,
    required this.onToggleLang,
  });

  @override
  Widget build(BuildContext context) {
    final topics = hindiSubjectTopics[subject] ?? ['सामान्य'];

    return Scaffold(
      appBar: AppBar(
        title: Text('$subject - टॉपिक', style: const TextStyle(fontSize: 16)),
        backgroundColor: const Color(0xFF151C2C),
        actions: [
          TextButton(
            onPressed: onToggleLang,
            child: Text(isEnglish ? 'हिन्दी' : 'English', style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topicName = topics[index];
          final qs = sampleQuestions.where((q) => q.topic == topicName).toList();

          return Card(
            color: const Color(0xFF1A2130),
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent.withOpacity(0.2),
                child: Text('${index + 1}', style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
              ),
              title: Text(topicName, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              subtitle: Text('उपलब्ध प्रश्न: ${qs.length}', style: const TextStyle(fontSize: 11, color: Colors.grey)),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: qs.isEmpty ? Colors.grey.shade700 : Colors.green.shade700),
                onPressed: qs.isEmpty
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizPlayScreen(
                              title: '$subject - $topicName',
                              questions: qs,
                              isGuest: isGuest,
                              isEnglish: isEnglish,
                            ),
                          ),
                        );
                      },
                child: const Text('प्रैक्टिस', style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ),
          );
        },
      ),
    );
  }
}

// त्वरित प्रकार स्क्रीन
class QuickTypeScreen extends StatelessWidget {
  final String testType;
  final bool isGuest;
  final bool isEnglish;
  const QuickTypeScreen({super.key, required this.testType, required this.isGuest, required this.isEnglish});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$testType (Railway Exams)', style: const TextStyle(fontSize: 16)),
        backgroundColor: const Color(0xFF151C2C),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: railwayExams.length,
        itemBuilder: (context, index) {
          final examName = railwayExams[index]['name']!;
          return Card(
            color: const Color(0xFF1A2130),
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              title: Text('$examName - $testType', style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.chevron_right, color: Colors.orangeAccent),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExamDetailScreen(examName: examName, isGuest: isGuest, isEnglish: isEnglish),
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

// 6. लाइव टेस्ट स्क्रीन (Previous + Mark Review + Next, सुरक्षित बॉटम स्पेस के साथ)
class QuizPlayScreen extends StatefulWidget {
  final String title;
  final List<QuestionItem> questions;
  final bool isGuest;
  final bool isEnglish;

  const QuizPlayScreen({
    super.key,
    required this.title,
    required this.questions,
    required this.isGuest,
    required this.isEnglish,
  });

  @override
  State<QuizPlayScreen> createState() => _QuizPlayScreenState();
}

class _QuizPlayScreenState extends State<QuizPlayScreen> {
  int _currentIndex = 0;
  final Map<int, int> _selectedAnswers = {};
  final Set<int> _markedForReview = {};
  late bool _englishMode;
  int _secondsLeft = 900;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _englishMode = widget.isEnglish;
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
    int correct = 0;
    int incorrect = 0;
    for (int i = 0; i < widget.questions.length; i++) {
      if (_selectedAnswers.containsKey(i)) {
        if (_selectedAnswers[i] == widget.questions[i].correctIndex) {
          correct++;
        } else {
          incorrect++;
        }
      }
    }

    if (widget.isGuest) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: const Color(0xFF1E2638),
          title: const Text('परिणाम (Result)'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('अंक (Marks): $correct / ${widget.questions.length}', style: const TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold)),
              Text('सही (Correct): $correct', style: const TextStyle(color: Colors.greenAccent)),
              Text('गलत (Incorrect): $incorrect', style: const TextStyle(color: Colors.redAccent)),
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
            correctCount: correct,
            incorrectCount: incorrect,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.questions[_currentIndex];
    final isMarked = _markedForReview.contains(_currentIndex);
    final qText = (_englishMode && q.questionEn.isNotEmpty) ? q.questionEn : q.question;
    final opts = (_englishMode && q.optionsEn.length == q.options.length) ? q.optionsEn : q.options;
    final mins = (_secondsLeft ~/ 60).toString().padLeft(2, '0');
    final secs = (_secondsLeft % 60).toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(fontSize: 13)),
        backgroundColor: const Color(0xFF151C2C),
        actions: [
          TextButton(
            onPressed: () => setState(() => _englishMode = !_englishMode),
            child: Text(_englishMode ? 'हिन्दी' : 'EN', style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text('$mins:$secs', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.orangeAccent)),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('प्रश्न ${_currentIndex + 1} / ${widget.questions.length} • ${q.topic}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
              const SizedBox(height: 10),
              Text(qText, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              ...List.generate(opts.length, (idx) {
                final selected = _selectedAnswers[_currentIndex] == idx;
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selected ? Colors.blueAccent : const Color(0xFF1E2638),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(14),
                    ),
                    onPressed: () => setState(() => _selectedAnswers[_currentIndex] = idx),
                    child: Text(opts[idx], style: const TextStyle(color: Colors.white)),
                  ),
                );
              }),
              const Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: const Color(0xFF151C2C),
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 24),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF28334A), padding: const EdgeInsets.symmetric(vertical: 12)),
                  onPressed: _currentIndex > 0 ? () => setState(() => _currentIndex--) : null,
                  child: const Text('Previous', style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: isMarked ? Colors.amber.shade700 : const Color(0xFF3A2E1E), padding: const EdgeInsets.symmetric(vertical: 12)),
                  onPressed: () {
                    setState(() {
                      if (isMarked) {
                        _markedForReview.remove(_currentIndex);
                      } else {
                        _markedForReview.add(_currentIndex);
                      }
                    });
                  },
                  child: Text(isMarked ? 'Unmark' : 'Mark Review', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _currentIndex < widget.questions.length - 1 ? Colors.blueAccent : Colors.green.shade700,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {
                    if (_currentIndex < widget.questions.length - 1) {
                      setState(() => _currentIndex++);
                    } else {
                      _submitQuiz();
                    }
                  },
                  child: Text(_currentIndex < widget.questions.length - 1 ? 'Next' : 'Submit', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 7. एनालिसिस और सॉल्यूशन स्क्रीन (केवल Login वालों के लिए)
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analysis & Solutions', style: TextStyle(fontSize: 16)),
        backgroundColor: const Color(0xFF151C2C),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final q = questions[index];
          final userAns = selectedAnswers[index];
          final isCorrect = userAns == q.correctIndex;

          return Card(
            color: const Color(0xFF1A2130),
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('प्रश्न ${index + 1} • ${q.topic}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 6),
                  Text(q.question, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 8),
                  Text('सही उत्तर: ${q.options[q.correctIndex]}', style: TextStyle(color: isCorrect ? Colors.greenAccent : Colors.orangeAccent, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: const Color(0xFF121826), borderRadius: BorderRadius.circular(8)),
                    child: Text('सॉल्यूशन: ${q.solution}', style: const TextStyle(fontSize: 13, color: Colors.white70)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

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

// सवाल का मॉडल (Category और Level के साथ)
class QuestionItem {
  final String category; // 'PYQ', 'Mini Mock', 'Full Mock', 'GK'
  final String level;    // 'Easy', 'Medium', 'Hard'
  final String question;
  final List<String> options;
  final int correctIndex;

  const QuestionItem({
    required this.category,
    required this.level,
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}

// RRB Group D Maths PYQ - Mini Mock (30 Easy Level Questions)
const List<QuestionItem> sampleQuestions = [
  // 1
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '1. किसी संख्या का 20% यदि 60 है, तो वह संख्या क्या होगी?',
    options: ['240', '300', '120', '360'],
    correctIndex: 1,
  ),
  // 2
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '2. यदि एक रेलगाड़ी 60 किमी/घंटा की चाल से चलती है, तो 15 मिनट में कितनी दूरी तय करेगी?',
    options: ['10 किमी', '12 किमी', '15 किमी', '20 किमी'],
    correctIndex: 2,
  ),
  // 3
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '3. 12, 18 और 24 का लघुत्तम समापवर्त्य (LCM) क्या है?',
    options: ['48', '72', '36', '96'],
    correctIndex: 1,
  ),
  // 4
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '4. 16 और 24 का महत्तम समापवर्तक (HCF) क्या है?',
    options: ['4', '6', '8', '12'],
    correctIndex: 2,
  ),
  // 5
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '5. ₹2,000 पर 10% वार्षिक दर से 2 वर्ष का साधारण ब्याज (SI) कितना होगा?',
    options: ['₹200', '₹400', '₹600', '₹800'],
    correctIndex: 1,
  ),
  // 6
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '6. एक वस्तु का क्रय मूल्य ₹400 और विक्रय मूल्य ₹460 है। लाभ प्रतिशत कितना है?',
    options: ['12%', '15%', '18%', '20%'],
    correctIndex: 1,
  ),
  // 7
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '7. प्रथम 10 प्राकृतिक संख्याओं का औसत क्या होगा?',
    options: ['5', '5.5', '6', '4.5'],
    correctIndex: 1,
  ),
  // 8
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '8. यदि 6 व्यक्ति किसी काम को 10 दिन में करते हैं, तो 12 व्यक्ति उसी काम को कितने दिन में करेंगे?',
    options: ['5 दिन', '8 दिन', '10 दिन', '20 दिन'],
    correctIndex: 0,
  ),
  // 9
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '9. 0.25 को भिन्न (Fraction) में बदलने पर क्या प्राप्त होगा?',
    options: ['1/2', '1/4', '1/5', '3/4'],
    correctIndex: 1,
  ),
  // 10
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '10. एक वर्ग की भुजा 12 सेमी है। इसका क्षेत्रफल कितना होगा?',
    options: ['48 वर्ग सेमी', '144 वर्ग सेमी', '24 वर्ग सेमी', '96 वर्ग सेमी'],
    correctIndex: 1,
  ),
  // 11
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '11. 75% को साधारण भिन्न के रूप में लिखिए।',
    options: ['1/2', '2/3', '3/4', '4/5'],
    correctIndex: 2,
  ),
  // 12
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '12. 144 का वर्गमूल (Square Root) क्या है?',
    options: ['11', '12', '13', '14'],
    correctIndex: 1,
  ),
  // 13
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '13. 8 का घनमूल (Cube Root) क्या है?',
    options: ['2', '3', '4', '6'],
    correctIndex: 0,
  ),
  // 14
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '14. यदि A : B = 2 : 3 और B : C = 4 : 5 है, तो A : B : C क्या होगा?',
    options: ['8 : 12 : 15', '2 : 3 : 5', '4 : 6 : 5', '6 : 12 : 15'],
    correctIndex: 0,
  ),
  // 15
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '15. एक आयत की लंबाई 10 सेमी और चौड़ाई 6 सेमी है। इसका परिमाप क्या होगा?',
    options: ['60 सेमी', '16 सेमी', '32 सेमी', '40 सेमी'],
    correctIndex: 2,
  ),
  // 16
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '16. 500 का 30% कितना होगा?',
    options: ['120', '150', '180', '200'],
    correctIndex: 1,
  ),
  // 17
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '17. यदि कोई कार 180 किमी की दूरी 3 घंटे में तय करती है, तो उसकी चाल (किमी/घंटा में) क्या है?',
    options: ['50 किमी/घंटा', '55 किमी/घंटा', '60 किमी/घंटा', '65 किमी/घंटा'],
    correctIndex: 2,
  ),
  // 18
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '18. 25, 35 और 45 का औसत क्या है?',
    options: ['30', '35', '40', '25'],
    correctIndex: 1,
  ),
  // 19
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '19. एक वस्तु ₹500 में खरीदी गई और ₹450 में बेची गई। हानि प्रतिशत कितना है?',
    options: ['5%', '10%', '15%', '20%'],
    correctIndex: 1,
  ),
  // 20
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '20. 3/5 को प्रतिशत में बदलिए।',
    options: ['40%', '50%', '60%', '75%'],
    correctIndex: 2,
  ),
  // 21
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '21. सबसे छोटी अभाज्य संख्या (Prime Number) कौन-सी है?',
    options: ['0', '1', '2', '3'],
    correctIndex: 2,
  ),
  // 22
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '22. 108 ÷ 12 + 5 का मान क्या होगा?',
    options: ['12', '14', '15', '16'],
    correctIndex: 1,
  ),
  // 23
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '23. ₹1,500 पर 8% वार्षिक दर से 3 वर्ष का साधारण ब्याज कितना होगा?',
    options: ['₹300', '₹360', '₹400', '₹450'],
    correctIndex: 1,
  ),
  // 24
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '24. एक त्रिभुज के तीनों कोणों का योग कितना होता है?',
    options: ['90°', '180°', '270°', '360°'],
    correctIndex: 1,
  ),
  // 25
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '25. यदि 15 पुस्तकों का मूल्य ₹300 है, तो 9 पुस्तकों का मूल्य क्या होगा?',
    options: ['₹150', '₹180', '₹200', '₹240'],
    correctIndex: 1,
  ),
  // 26
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '26. 19² (19 का वर्ग) कितना होता है?',
    options: ['324', '342', '361', '380'],
    correctIndex: 2,
  ),
  // 27
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '27. 125 का घनमूल क्या है?',
    options: ['3', '4', '5', '25'],
    correctIndex: 2,
  ),
  // 28
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '28. यदि x + 15 = 42, तो x का मान क्या है?',
    options: ['25', '27', '28', '57'],
    correctIndex: 1,
  ),
  // 29
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '29. 40 और 60 का अनुपात सरल रूप में क्या होगा?',
    options: ['2 : 3', '3 : 2', '4 : 6', '1 : 2'],
    correctIndex: 0,
  ),
  // 30
  QuestionItem(
    category: 'Mini Mock',
    level: 'Easy',
    question: '30. 1 घंटे में कितने सेकंड होते हैं?',
    options: ['600 सेकंड', '1800 सेकंड', '3600 सेकंड', '7200 सेकंड'],
    correctIndex: 2,
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
      Center(child: Text('स्वागत है, ${widget.userName}!\n(Home Screen)', textAlign: TextAlign.center, style: const TextStyle(fontSize: 20))),
      TestsTabScreen(userName: widget.userName),
      const CategoryTestListScreen(category: 'Mini Mock', title: 'Mini Mock Tests'),
      const CategoryTestListScreen(category: 'Full Mock', title: 'Full Mock Tests'),
      const CategoryTestListScreen(category: 'GK', title: 'General Knowledge (GK)'),
      const CategoryTestListScreen(category: 'PYQ', title: 'Previous Year Questions (PYQ)'),
    ];

    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF151C2C),
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined), label: 'Tests'),
          BottomNavigationBarItem(icon: Icon(Icons.alarm_on_outlined), label: 'Mini Mock'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_turned_in_outlined), label: 'Full Mock'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), label: 'GK'),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.campaign_outlined),
                Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(radius: 4, backgroundColor: Colors.red),
                ),
              ],
            ),
            label: 'PYQ / New',
          ),
        ],
      ),
    );
  }
}

// 3. 'Tests' टैब
class TestsTabScreen extends StatelessWidget {
  final String userName;
  const TestsTabScreen({super.key, required this.userName});

  void _openCategory(BuildContext context, String category, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryTestListScreen(category: category, title: title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('RAILWAY MOCK TESTS', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
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
                  Text('100% Free with Ads 🔓', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 6),
                  Text('Watch a 5-second ad to unlock any test or PYQ instantly - no paywall!', style: TextStyle(fontSize: 13, color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFFE65100), Color(0xFFFF8F00)]),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [
                  const Text('Remove Ads for 1 Full Year at ₹29', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 6),
                  const Text('Skip Ads and study uninterrupted for less than the price of a snack! Just ₹29 for 12 months.', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.white70)),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                    onPressed: () {},
                    child: const Text('GET NO-ADS YEARLY PASS at ₹29/year', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Test Series & Categories', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.4,
              children: [
                _buildCategoryTile(context, Icons.alarm, 'Mini Mock', 'Group D Maths Easy (30Q)', 'Mini Mock'),
                _buildCategoryTile(context, Icons.history_edu, 'PYQ Series', 'Previous Year Questions', 'PYQ'),
                _buildCategoryTile(context, Icons.assignment_turned_in, 'Full Mock', 'Complete Exam Pattern', 'Full Mock'),
                _buildCategoryTile(context, Icons.menu_book, 'GK & GS', 'General Knowledge', 'GK'),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.play_circle_fill),
              label: const Text('START GROUP D MINI MOCK (EASY)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7D32),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () => _openCategory(context, 'Mini Mock', 'Mini Mock Tests'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTile(BuildContext context, IconData icon, String title, String subtitle, String categoryKey) {
    return InkWell(
      onTap: () => _openCategory(context, categoryKey, title),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: const Color(0xFF1A2130), borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.orangeAccent, size: 24),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white)),
            Text(subtitle, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

// 4. कैटेगरी और Level के हिसाब से टेस्ट शुरू करने की स्क्रीन
class CategoryTestListScreen extends StatefulWidget {
  final String category;
  final String title;

  const CategoryTestListScreen({super.key, required this.category, required this.title});

  @override
  State<CategoryTestListScreen> createState() => _CategoryTestListScreenState();
}

class _CategoryTestListScreenState extends State<CategoryTestListScreen> {
  String _selectedLevel = 'Easy';

  @override
  Widget build(BuildContext context) {
    final filtered = sampleQuestions
        .where((q) => q.category == widget.category && q.level == _selectedLevel)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(fontSize: 16)),
        backgroundColor: const Color(0xFF151C2C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Level चुनें:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 10),
            Row(
              children: ['Easy', 'Medium', 'Hard'].map((lvl) {
                final isSelected = _selectedLevel == lvl;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ChoiceChip(
                      label: Text(lvl),
                      selected: isSelected,
                      selectedColor: Colors.blueAccent,
                      onSelected: (_) {
                        setState(() => _selectedLevel = lvl);
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E2638),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.title} ($_selectedLevel Level)',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    filtered.isEmpty
                        ? 'इस लेवल के प्रश्न जल्द ही जोड़े जाएंगे।'
                        : 'कुल प्रश्न: ${filtered.length} | Group D Maths PYQ',
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  const SizedBox(height: 14),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                    onPressed: filtered.isEmpty
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizPlayScreen(
                                  title: '${widget.title} - $_selectedLevel',
                                  questions: filtered,
                                ),
                              ),
                            );
                          },
                    child: const Text('Start Test Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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

// 5. लाइव मॉक टेस्ट खेलने की स्क्रीन
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
  int _secondsLeft = 900; // 15 मिनट का टाइमर (30 प्रश्नों के लिए)
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
        title: Text(widget.title, style: const TextStyle(fontSize: 14)),
        backgroundColor: const Color(0xFF151C2C),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Text('$mins:$secs', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.orangeAccent)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('प्रश्न ${_currentIndex + 1} / ${widget.questions.length}', style: const TextStyle(color: Colors.grey)),
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

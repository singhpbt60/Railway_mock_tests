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

// 1. लॉगिन और स्किप (Guest Mode) स्क्रीन
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
              // Skip Button (ऊपर दाईं तरफ)
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

              // नाम बॉक्स
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

              // मोबाइल नंबर बॉक्स
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

              // Login Button
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

// 2. मुख्य नेविगेशन (Bottom Nav Bar के साथ)
class MainNavigationScreen extends StatefulWidget {
  final String userName;
  const MainNavigationScreen({super.key, required this.userName});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 1; // डिफ़ॉल्ट 'Tests' टैब खुला रहेगा

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      Center(child: Text('स्वागत है, ${widget.userName}!\n(Home Screen)', textAlign: TextAlign.center, style: const TextStyle(fontSize: 20))),
      TestsTabScreen(userName: widget.userName),
      const Center(child: Text('मिनी मॉक टेस्ट (Mini Mock)', style: TextStyle(fontSize: 20))),
      const Center(child: Text('फुल मॉक टेस्ट (Full Mock)', style: TextStyle(fontSize: 20))),
      const Center(child: Text('सामान्य ज्ञान (GK)', style: TextStyle(fontSize: 20))),
      const Center(child: Text('नया अपडेट (New)', style: TextStyle(fontSize: 20))),
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
            label: 'New',
          ),
        ],
      ),
    );
  }
}

// 3. 'Tests' (मॉक टेस्ट और ₹29 सब्सक्रिप्शन स्क्रीन)
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
            const Text('Available Features', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5,
              children: [
                _buildFeatureCard(Icons.quiz_outlined, '150,000+ Mock Tests & PYQs', 'Free with Ads'),
                _buildFeatureCard(Icons.g_translate_outlined, 'Dual Bilingual', 'English & Hindi'),
                _buildFeatureCard(Icons.leaderboard_outlined, 'All India Rank', 'Instant Results'),
                _buildFeatureCard(Icons.payment_outlined, 'One-Click UPI', 'Safe & Fast'),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.play_circle_fill),
              label: const Text('CONTINUE FREE WITH ADS'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7D32),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFF1A2130), borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.orangeAccent, size: 24),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)),
          Text(subtitle, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      ),
    );
  }
}

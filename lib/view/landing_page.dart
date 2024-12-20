import 'package:career_connect/view/splash_screen.dart';
import 'package:flutter/material.dart';
// import 'splash_screen.dart'; // Import the SplashScreen

class CareerConnectOnboardingView extends StatefulWidget {
  const CareerConnectOnboardingView({super.key});

  @override
  _CareerConnectOnboardingViewState createState() =>
      _CareerConnectOnboardingViewState();
}

class _CareerConnectOnboardingViewState
    extends State<CareerConnectOnboardingView> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/image1.png",
      "title": "Discover Opportunities",
      "description":
          "Find your dream job and connect with top employers around the globe."
    },
    {
      "image": "assets/images/image2.jpg",
      "title": "Build Your Professional Network",
      "description":
          "Engage with like-minded professionals and grow your career connections."
    },
    {
      "image": "assets/images/image3.jpg",
      "title": "Achieve Your Goals",
      "description":
          "Get expert advice and career resources to achieve your professional ambitions."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      onboardingData[index]["image"]!,
                      height: 300,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      onboardingData[index]["title"]!,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.blue.shade800,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        onboardingData[index]["description"]!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[600],
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingData.length,
                    (index) => buildDot(index: index),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity, // Full width button
                  child: ElevatedButton(
                    onPressed: () {
                      if (currentPage == onboardingData.length - 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SplashScreen(),
                          ),
                        );
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      currentPage == onboardingData.length - 1
                          ? "Get Started"
                          : "Next",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 8),
      height: 10,
      width: currentPage == index ? 20 : 10,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.blue.shade800 : Colors.grey[400],
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

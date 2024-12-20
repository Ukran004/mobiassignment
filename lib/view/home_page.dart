import 'package:flutter/material.dart';


class JobListingPage extends StatelessWidget {
  const JobListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CareerConnect', style: TextStyle()),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilterChipWidget(label: 'All Jobs', isSelected: true),
                  FilterChipWidget(label: 'Remote'),
                  FilterChipWidget(label: 'Full-time'),
                  FilterChipWidget(label: 'Part-time'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Featured Jobs',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            JobCard(
              jobTitle: 'Senior Software Engineer',
              companyName: 'TechCorp Solutions',
              salary: '\$120,000 - \$180,000/year',
              tags: ['Remote', 'Full-time'],
            ),
            JobCard(
              jobTitle: 'Product Marketing Manager',
              companyName: 'FinanceWise Inc.',
              salary: '\$90,000 - \$130,000/year',
              tags: ['Hybrid', 'Full-time'],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text('Career Resources',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            CareerResourceWidget(
                title: 'Resume Tips',
                subtitle: 'Create a standout resume',
                icon: Icons.description),
            CareerResourceWidget(
                title: 'Interview Prep',
                subtitle: 'Ace your interviews',
                icon: Icons.mic),
            CareerResourceWidget(
                title: 'Industry Trends',
                subtitle: 'Stay updated',
                icon: Icons.trending_up),
            CareerResourceWidget(
                title: 'Career Growth',
                subtitle: 'Plan your future',
                icon: Icons.bar_chart),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/jobListing');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/resume');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/saved');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/profile');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Jobs'),
          BottomNavigationBarItem(
              icon: Icon(Icons.description), label: 'Resume'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;

  const FilterChipWidget(
      {super.key, required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {},
    );
  }
}

class JobCard extends StatelessWidget {
  final String jobTitle;
  final String companyName;
  final String salary;
  final List<String> tags;

  const JobCard({
    super.key,
    required this.jobTitle,
    required this.companyName,
    required this.salary,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(jobTitle,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(companyName, style: TextStyle(color: Colors.grey[700])),
            const SizedBox(height: 8),
            Row(
              children: tags
                  .map((tag) => Container(
                        margin: const EdgeInsets.only(right: 8.0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(tag,
                            style: const TextStyle(
                              fontSize: 12,
                            )),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 8),
            Text(
              salary,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Apply Now'),
            )
          ],
        ),
      ),
    );
  }
}

class CareerResourceWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const CareerResourceWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blueAccent,
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {},
    );
  }
}

// Resume Page
class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/jobListing');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Resume')),
        body: const Center(child: Text('Resume Page Content')),
      ),
    );
  }
}

// Saved Page
class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/jobListing');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Saved')),
        body: const Center(child: Text('Saved Jobs Content')),
      ),
    );
  }
}

// Profile Page
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/jobListing');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: const Center(child: Text('Profile Page Content')),
      ),
    );
  }
}

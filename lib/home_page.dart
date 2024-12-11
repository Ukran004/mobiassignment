import 'package:flutter/material.dart';

void main() {
  runApp(CareerConnectApp());
}

class CareerConnectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JobListingPage(),
    );
  }
}

class JobListingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CareerConnect', style: TextStyle(color: Colors.blueAccent)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.blueAccent),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.blueAccent),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Featured Jobs',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text('Career Resources',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
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
        onTap: (index) {},
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Jobs'),
          BottomNavigationBarItem(icon: Icon(Icons.description), label: 'Resume'),
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

  FilterChipWidget({required this.label, this.isSelected = false});

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

  JobCard({
    required this.jobTitle,
    required this.companyName,
    required this.salary,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(jobTitle,
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(companyName, style: TextStyle(color: Colors.grey[700])),
            SizedBox(height: 8),
            Row(
              children: tags
                  .map((tag) => Container(
                        margin: EdgeInsets.only(right: 8.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(tag,
                            style: TextStyle(
                                fontSize: 12, color: Colors.blueAccent)),
                      ))
                  .toList(),
            ),
            SizedBox(height: 8),
            Text(salary, style: TextStyle(color: Colors.green[700])),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              child: Text('Apply Now'),
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

  CareerResourceWidget({
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

import 'package:career_connect/features/home/presentation/view/pages/court_detail_page.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> jobNames = [
    'Software Developer at TechCorp',
    'Marketing Manager at Innovate Ltd',
    'Monastery Futsal',
    'UX Designer at DesignStudio',
  ];
  final List<String> jobImages = [
    'assets/images/engineer.jpg',
    'assets/images/softdev.jpg',
    'assets/images/manager.jpg',
    'assets/images/image2.jpg',
  ];
  List<String> filteredCourtNames = [];
  List<String> filteredCourtImages = [];

  @override
  void initState() {
    super.initState();
    filteredCourtNames = List.from(jobNames);
    filteredCourtImages = List.from(jobImages);
    _searchController.addListener(_filterCourts);
  }

  void _filterCourts() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredCourtNames =
          jobNames.where((job) => job.toLowerCase().contains(query)).toList();
      filteredCourtImages = [];
      for (var job in filteredCourtNames) {
        int index = jobNames.indexOf(job);
        if (index != -1) {
          filteredCourtImages.add(jobImages[index]);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search jobs...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemCount: filteredCourtNames.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JobDetailPage(
                        jobName: filteredCourtNames[index],
                        jobImage: filteredCourtImages[index],
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15)),
                        child: Image.asset(
                          filteredCourtImages[index],
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          filteredCourtNames[index],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

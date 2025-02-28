import 'package:flutter/material.dart';
import 'package:projectmobile/Model/scoccerModel.dart';

class TeamDetailsScreen extends StatefulWidget {
  final Standing team;

  const TeamDetailsScreen({Key? key, required this.team}) : super(key: key);

  @override
  _TeamDetailsScreenState createState() => _TeamDetailsScreenState();
}

class _TeamDetailsScreenState extends State<TeamDetailsScreen>
    with SingleTickerProviderStateMixin {
  bool isFavorite = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              widget.team.team?.logo ?? '',
              width: 100,
              height: 100,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.error,
                color: Colors.red,
                size: 40,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.team.team?.name ?? 'No Name',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: Colors.yellow,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
                // Thêm logic xử lý khi thêm hoặc xóa khỏi yêu thích ở đây
              });
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 77, 16, 28)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(158, 10, 10, 10),
        ),
        child: Column(
          children: [
            // TabBar nằm ngoài AppBar
            Container(
              color: Color.fromARGB(158, 10, 10, 10),
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(icon: Icon(Icons.info)),               // Icon thông tin
                  Tab(icon: Icon(Icons.perm_contact_calendar)),       // Icon thống kê cầu thủ
                  Tab(icon: Icon(Icons.calendar_today)),
                ],
              ),
            ),
            // Nội dung của từng tab
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Trang Thông tin
                  Center(child: Text('Nội dung thông tin của đội bóng')),
                  // Trang Thống kê cầu thủ
                  Center(child: Text('Nội dung thống kê cầu thủ')),
                  // Trang Lịch thi đấu
                  Center(child: Text('Nội dung lịch thi đấu')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

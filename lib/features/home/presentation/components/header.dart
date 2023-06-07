import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';

class HeaderHomePage extends StatefulWidget {
  final TabController tabController;
  const HeaderHomePage({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  State<HeaderHomePage> createState() => _HeaderHomePageState();
}

class _HeaderHomePageState extends State<HeaderHomePage> {
  late Duration _elapsedTime;
  @override
  void initState() {
    super.initState();
    _elapsedTime = Duration.zero;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30),
      color: Colors.black,
      child: Row(
        children: [
          const SizedBox(width: 4),
          Icon(
            Icons.timer,
            color: Colors.white.withOpacity(0.6),
          ),
          const SizedBox(width: 3),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.20,
            child: Opacity(
              opacity: 0.6,
              child: TimerBuilder.periodic(
                const Duration(seconds: 1),
                builder: (context) {
                  _elapsedTime += const Duration(seconds: 1);
                  final formattedTime =
                      '${_elapsedTime.inMinutes.toString().padLeft(2, '0')}m ${(_elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}s';
                  return Text(
                    formattedTime,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: DefaultTabController(
              length: 2, // Number of tabs
              child: TabBar(
                controller: widget.tabController,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 4,
                    color: Colors.white,
                  ),
                  insets: EdgeInsets.symmetric(
                      horizontal: 2), // Desired insets for the indicator
                ),
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                tabs: const [
                  Tab(
                    child: Text(
                      'Following',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.5,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'For You',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 28,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

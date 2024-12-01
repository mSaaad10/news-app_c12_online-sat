import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c12_online_sat/domain/etities/source_entitiy.dart';
import 'package:news_app_c12_online_sat/presentation/screens/home/tabs/articles/view/articles_view.dart';
import 'package:news_app_c12_online_sat/presentation/screens/home/tabs/sources/widgets/source_widget.dart';

class SourceTabs extends StatefulWidget {
  SourceTabs({super.key, required this.sources});

  List<SourceEntity> sources;
  int x = 0;

  @override
  State<SourceTabs> createState() => _SourceTabsState();
}

class _SourceTabsState extends State<SourceTabs> {
  int tappedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
              onTap: (index) {
                tappedIndex = index; // 2
                setState(() {});
              },
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
              labelPadding: REdgeInsets.symmetric(horizontal: 8),
              isScrollable: true,
              tabs: widget.sources
                  .map(
                    (source) => SourceWidget(
                        source: source,
                        isSelected:
                            widget.sources.indexOf(source) == tappedIndex),
                  )
                  .toList()),
        ),
        ArticlesView(
          source: widget.sources[tappedIndex],
        )
      ],
    );
  }
}

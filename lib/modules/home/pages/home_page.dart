import 'package:flutter/material.dart';
import 'package:flutter_note_app/modules/home/widgets/note_category_widget.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("نوشته ها"),
        const SizedBox(height: 12),
        Expanded(
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  mainAxisExtent: MediaQuery.sizeOf(context).height / 9
              ),
              itemBuilder: (context, index) => NoteCategoryWidget(title: "یادداشت شخصی",notes: index * 2),
            )
        )
      ],
    );
  }
}



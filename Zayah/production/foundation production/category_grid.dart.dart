import 'package:flutter/material.dart';

import '../../domain/entities/service_category.dart';

class CategoryGrid extends StatelessWidget {
  final List<ServiceCategory> categories;

  const CategoryGrid({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (_, index) {
        final category = categories[index];

        return Card(
          child: InkWell(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      NetworkImage(category.imageUrl),
                ),
                const SizedBox(height: 10),
                Text(category.name),
              ],
            ),
          ),
        );
      },
    );
  }
}
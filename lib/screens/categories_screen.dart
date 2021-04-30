import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mealApp/dummy_data.dart';
import 'package:mealApp/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: DUMMY_CATEGORIES.length,
        itemBuilder: (BuildContext ctx, index) {
          return CategoryItem(
              DUMMY_CATEGORIES[index].id,
              DUMMY_CATEGORIES[index].title,
              DUMMY_CATEGORIES[index].color,
              DUMMY_CATEGORIES[index].imageurl);
        },
        /*children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                  catData.id, catData.title, catData.color, catData.imageurl),
            )
            .toList(),*/ //حولناها لليست اوف ويدجيت عن طريق الماب
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 3 / 2,
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}

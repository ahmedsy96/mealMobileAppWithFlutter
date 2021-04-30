import 'package:flutter/material.dart';
import 'package:mealApp/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String imageurl;

  CategoryItem(
    this.id,
    this.title,
    this.color,
    this.imageurl,
  );
  void selectScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        "title": title, //كي ينتقل الى صفحات مختلفة
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectScreen(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(
          15), //اضفنا الحواف هنا ايضا من اجل ان يكون الحواف دائرية عند الضغط
      child: Container(
        padding: EdgeInsets.all(2),
        child: Stack(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageurl,
                ),
              ),
            ),
            Center(
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.black.withOpacity(0.6),
                    fontSize: 23),
              ),
            )
          ],
        ),
        /*child: Text(
          title,
          style: TextStyle(backgroundColor: Colors.white, fontSize: 20),
        ), */ //العنوان الذي استقبلته من الماب
        /*decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.4),
                color,
              ]),
          borderRadius: BorderRadius.circular(15),
        ),*/
      ),
    );
  }
}

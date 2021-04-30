import 'package:flutter/material.dart';
import 'package:mealApp/models/meal.dart';
import 'package:mealApp/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    @required this.id,
    @required this.imageUrl,
    @required this.title,
    @required this.duration,
    @required this.affordability,
    @required this.complexity,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "simple";
        break;
      case Complexity.Challenging:
        return "challengin";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "unKnown";
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      default:
        return "unKnown";
        break;
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(MealDetailsScren.routeName, arguments: id)
        .then((result) {
      /*if (result != null) {
        removeItem(result);*/
    }); //لاستقبال البيانات من الصفحة المحذوفة
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectMeal(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  //كي نجعل حواف للصورة
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 20,
                  child: Container(
                    color: Colors.black.withOpacity(0.7),
                    width: 300,
                    padding: EdgeInsets.symmetric(
                      //من اجل ابعا النص عن الحواف
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6, //الفصل بشكل افقي بين العنصرين بنفس السطر
                      ),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      Text("$complexityText"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      Text("$affordabilityText"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mealApp/dummy_data.dart';

class MealDetailsScren extends StatelessWidget {
  static const routeName = "meal_detial";
  final Function toggleFacorite;
  final Function isMealFavorites; //تساعدنا باعطاء شكل للايقونة الخاصة بالمفضلة

  MealDetailsScren(this.toggleFacorite, this.isMealFavorites);
  Widget buildSectionTitle(BuildContext ctx, String text) {
    //الدالة الخاصة باتايتل
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: 300,
      height: 150,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments.toString();
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) =>
        meal.id == mealId); //شرط لجلب الصورة اللازمة فقططططط فقط يعيد عنصر واحد
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 300,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.network(
                  selectedMeal.imageUrl,
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.green.withOpacity(0.7),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ), //=> عند استخدامها نحن لسنا بحاجة لاستغمال ريترن
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        //ياخد اللون من البرايمري كولور
                        child: Text("# ${index + 1}"),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Divider(
                      color: Colors.green,
                    ), //يرسم الفاصل بين كل خطوة وخطوة
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ), //=> عند استخدامها نحن لسنا بحاجة لاستغمال ريترن
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isMealFavorites(mealId) ? Icons.star : Icons.star_border),
        onPressed: () {
          toggleFacorite(mealId);
        },
      ),
    );
  }
}

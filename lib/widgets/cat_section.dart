import 'package:flutter/material.dart';
import 'package:shop_app/models/get_category.dart';

class CategorySection extends StatelessWidget {
  CategorySection({Key? key, required this.model}) : super(key: key);

  final CatModel model;

  final double itemSize = 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 7),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          alignment: Alignment.bottomCenter,
          height: itemSize,
          width: itemSize,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: NetworkImage(model.data!.data[index].image!),
              fit: BoxFit.cover
            ),
          ),
          child: Container(
            width: 100,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
            ),
            child: Text(
              model.data!.data[index].name!.toUpperCase(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white,fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(width: 15),
        itemCount: 5,
      ),
    );
  }
}

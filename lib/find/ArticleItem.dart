import 'package:flutter/material.dart';
import 'package:flutter_app/find/Article.dart';

class ArticleItem extends StatelessWidget {
  
  final Article model;

  ArticleItem(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 150,
      child: Card(
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: <Widget>[
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(model.logo),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        model.location.substring(0, model.location.length > 6
                          ? 6
                          : model.location.length),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('| ' + model.type, 
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey
                            )
                          ),
                          Text('| ' + model.size, 
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey
                            )
                          ),
                          Text('| ' + model.employee,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey
                            )
                          )
                        ],
                      ),
                    ],
                  ),
                  Divider(height: 20, color: Colors.red),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '热招：${model.hot} 等${model.count}个职位',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ), 
      ),
    );
  }
}
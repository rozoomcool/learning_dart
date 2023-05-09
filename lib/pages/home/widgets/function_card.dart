import 'package:crypto_dashboard/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:crypto_dashboard/utils/adaptive_height_extension.dart';
import 'package:crypto_dashboard/utils/icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class functionCard extends StatelessWidget {
  final String name;
  final Widget details;

  functionCard({required this.name, required this.details});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        children: [
          SlidableAction(
              backgroundColor: kSuccessColor,
              icon: FlutterIcons.plus_fea,
              foregroundColor: Colors.white,
              onPressed: null)
        ],
        extentRatio: 0.25,
        motion: const DrawerMotion(),
      ),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            backgroundColor: kDangerColor,
            icon: FlutterIcons.x_fea,
            foregroundColor: Colors.white,
            onPressed: null,
          )
        ],
        extentRatio: 0.25,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return details;
              },
            ),
          );
        },
        child: Container(
          height: 90.0.h,
          color: Color.fromRGBO(55, 66, 92, 0.4),
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                    ),
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

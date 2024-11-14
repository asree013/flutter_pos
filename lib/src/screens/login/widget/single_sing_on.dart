import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/single_sing_on_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SingleSingOn extends StatelessWidget {
  const SingleSingOn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _build_Divinder(),
        SizedBox(height: 12,),
        _buildSingleSindOn(),
      ],
    );
  }

  Row _build_Divinder() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.white10, Colors.white],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.0, 1.0],
            )),
            width: 100,
            height: 1,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "or",
              style: TextStyle(
                color: Colors.white60,
                fontSize: 16.0,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.white10, Colors.white],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.0, 1.0],
            )),
            width: 100,
            height: 1,
          ),
        ],
      );

  Padding _buildSingleSindOn() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: VSingSingOnModel()
              .items
              .map((r) => FloatingActionButton(
                    heroTag: r.icon.toString(),
                    onPressed: r.onPressed,
                    backgroundColor: r.backgroundColor,
                    child: FaIcon(
                      r.icon,
                      color: Colors.white,
                    ),
                  ))
              .toList(),
        ),
      );
}

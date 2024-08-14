import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:soccer_app/model/dummy_data.dart';

class MatchesPage extends StatelessWidget {
  const MatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: matchList.length,
        itemBuilder:(context, index) {
          return Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: Color.fromARGB(255, 234, 245, 242),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 150,
              child: Column(
                children: [
                  // One Row for Home Team
                  Row(
                    children: [
                      // Text For home team and score
                      Text(allTeams[matchList[index].homeID - 1].teamName),
                      Text(matchList[index].homeScore.toString())
                    ],
                  ),

                  Row(
                    children: [
                      // Text For away team and score
                      Text(allTeams[matchList[index].awayID - 1].teamName),
                      Text(matchList[index].awayScore.toString())
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
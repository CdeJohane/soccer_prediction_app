import 'package:soccer_app/model/match.dart';
import 'package:soccer_app/model/player.dart';
import 'package:soccer_app/model/prediction_log.dart';
import 'package:soccer_app/model/selection.dart';
import 'package:soccer_app/model/team.dart';

final List<Player> dummyPlayers= [
  Player(1, 'Junior', 'jjthegametrepreneur@gmail.com'),
  Player(2, 'DaliTheGrey', 'dalithegrey@gmail.com'),
  Player(3, 'JLennon', 'jlennon@jlennon.com'),
  Player(4, 'ThaJudge', 'ThaJudge@gmail.com'),
  Player(5, 'Lmessi', 'Lmesso@miami.com')
];

final List<Match> matchList = [
  Match(1, 1, 2, DateTime.parse('2024-08-16 21:00:00'), true, 2, 0, 1, 1), // Man U vs fulham, MAn U wins
  Match(2, 3, 4, DateTime.parse('2024-08-17 13:30:00'), true, 0, 1, 4, 2), // Ipswich vs Liverpool, liverpool wins
  Match(3, 5, 6, DateTime.parse('2024-08-17 16:00:00'), true, 2, 2, -1, 0), // Arsenal vs wolves, Draw
  Match(4, 1, 2, DateTime.parse('2024-08-16 21:00:00'), true, 2, 0, 1, 1), // Man U vs fulham, MAn U wins
  Match(5, 3, 4, DateTime.parse('2024-08-17 13:30:00'), true, 0, 1, 4, 2), // Ipswich vs Liverpool, liverpool wins
  Match(6, 5, 6, DateTime.parse('2024-08-17 16:00:00'), true, 2, 2, -1, 0), // Arsenal vs wolves, Draw
  Match(7, 1, 2, DateTime.parse('2024-08-16 21:00:00'), true, 2, 0, 1, 1), // Man U vs fulham, MAn U wins
  Match(8, 3, 4, DateTime.parse('2024-08-17 13:30:00'), true, 0, 1, 4, 2), // Ipswich vs Liverpool, liverpool wins
  Match(9, 5, 6, DateTime.parse('2024-08-17 16:00:00'), true, 2, 2, -1, 0), // Arsenal vs wolves, Draw
  Match(10, 7, 2, DateTime.parse('2024-08-17 16:00:00'), false, 0, 0, -1, -1)
];

final List<Selection> allSelections = [
  Selection(selectionID: 1, playerID: 1, matchID: 1, teamChoice: 1, resultAdded: false),
  Selection(selectionID: 2, playerID: 2, matchID: 1, teamChoice: 1,resultAdded: false),
  Selection(selectionID: 3, playerID: 3, matchID: 1, teamChoice: 0, resultAdded: false),
  Selection(selectionID: 4, playerID: 4, matchID: 1, teamChoice: 1, resultAdded: false),
  Selection(selectionID: 5, playerID: 5, matchID: 1, teamChoice: 2, resultAdded: false),
  Selection(selectionID: 6, playerID: 1, matchID: 2, teamChoice: 0, resultAdded: false),
  Selection(selectionID: 7, playerID: 2, matchID: 2, teamChoice: 1, resultAdded: false),
  Selection(selectionID: 8, playerID: 3, matchID: 2, teamChoice: 2, resultAdded: false),
  Selection(selectionID: 9, playerID: 4, matchID: 2, teamChoice: 0, resultAdded: false),
  Selection(selectionID: 10, playerID: 5, matchID: 2, teamChoice: 1, resultAdded: false),
];

final List<Team> allTeams = [
  Team(teamID: 1, teamName: 'Manchester United'),
  Team(teamID: 2, teamName: 'Fulham'),
  Team(teamID: 3, teamName: 'Ipswich'),
  Team(teamID: 4, teamName: 'Liverpool'),
  Team(teamID: 5, teamName: 'ArsenalFC'),
  Team(teamID: 6, teamName: 'Wolverhampton Wanderers'),
  Team(teamID: 7, teamName: 'Brighton and Hove Albion')
];
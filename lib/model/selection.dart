class Selection{
  final int selectionID;
  final int playerID;
  final int matchID;
  bool resultAdded = false;
  int winOrLose = -1; // 0 for loss, 1 for win, -1 for not completed yet
  DateTime? date;
  int teamChoice = -1; // 0 for predicted draw, 1 for predicted home, 2 for away

  Selection({required this.selectionID, required this.playerID, required this.matchID, this.date, required this.teamChoice, required this.resultAdded});
}
class Selection{
  final int selectionID;
  final int playerID;
  final int matchID;
  int winOrLose = -1; // 0 for loss, 1 for win, -1 for not completed yet
  DateTime? date;
  int teamChoiceID = -1;

  Selection({required this.selectionID, required this.playerID, required this.matchID, this.date, required this.teamChoiceID});
}
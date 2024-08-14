class Match{
  // Variables to be used
  int? _matchID;
  final int _homeID;
  final int _awayID;
  bool _completed = false;
  int _homeScore = 0;
  int _awayScore = 0;
  int _winnerID = -1;
  DateTime? _date;

  // Use Default COnstructor
  Match(this._matchID, this._homeID, this._awayID, this._date, this._completed, this._homeScore, this._awayScore, this._winnerID);

  // Functions for winner
  void setWinner(int hScore, int aScore){
    if (_completed){
      // Set home and Away Scores
      _homeScore = hScore;
      _awayScore = aScore;

      // Compare the 2 scores
      int diff = hScore - aScore;

      if (diff > 0){
        _winnerID = _homeID; // Home Win
      } else if (diff < 0){
        _winnerID = _awayID; // Away Win
      } else {
        _winnerID = 0;// Indicates draw
      }
    }
  }
}
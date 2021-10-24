abstract class NewsStates{}


class NewsInitialStates extends NewsStates{

}


class NewsBottomNavStates extends NewsStates{}

class NewsBusinessSuccess extends NewsStates{}

class NewsBusinessLoading extends NewsStates{}

class NewsBusinessFailed extends NewsStates{
  final  String error;
  NewsBusinessFailed(this.error);

}

class NewsSportsSuccess extends NewsStates{}

class NewsSportsLoading extends NewsStates{}

class NewsSportsFailed extends NewsStates{
  final  String error;
  NewsSportsFailed(this.error);

}


class NewsScienceSuccess extends NewsStates{}

class NewsScienceLoading extends NewsStates{}

class NewsScienceFailed extends NewsStates{
  final  String error;
  NewsScienceFailed(this.error);

}


class NewsSearchSuccess extends NewsStates{}

class NewsSearchLoading extends NewsStates{}

class NewsSearchFailed extends NewsStates{
  final  String error;
  NewsSearchFailed(this.error);

}

class ChangeModeStateLight extends NewsStates{}
class ChangeModeStateDark extends NewsStates{}


part of 'meme_bloc.dart';

abstract class MemeEvent extends Equatable {
  const MemeEvent();
}

class MemeChanged extends MemeEvent {
  @override
  List<Object> get props => [];
}

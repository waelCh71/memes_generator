part of 'meme_bloc.dart';

@immutable
abstract class MemeState extends Equatable {
  const MemeState();
}

class MemeInitial extends MemeState {
  @override
  List<Object?> get props => [];
}

class MemeLoaded extends MemeState {
  final MemesModel meme;
  const MemeLoaded(this.meme);

  @override
  List<Object?> get props => [meme];
}

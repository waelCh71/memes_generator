import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/memes_model.dart';
import '../../repositry/meme_repostry.dart';
part 'meme_event.dart';
part 'meme_state.dart';

class MemeBloc extends Bloc<MemeEvent, MemeState> {
  final MemeRepositry memeRepositry;

  MemeBloc({required this.memeRepositry}) : super(MemeInitial()) {
    on<MemeChanged>((event, emit) async {
      final meme = await memeRepositry.getMeme();
      emit(MemeLoaded(meme));
    });
  }
}

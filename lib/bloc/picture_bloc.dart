import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:bloc_concurrency_practice/repository/picture_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PictureBloc extends Bloc<PictureEvent, PictureState> {
  PictureRepository pictureRepository;
  PictureBloc(this.pictureRepository) : super(const PictureState.init()) {
    on<PictureEvent>(
      (event, emit) async {
        emit(state.copuWith(count: state.count + 1));
        var result = await pictureRepository.animalPictures(state.count);
        emit(state.copuWith(path: result));
      },
      transformer: droppable(),
    );
  }
}

class PictureEvent {}

class PictureState extends Equatable {
  final int count;
  final String? path;
  const PictureState({
    required this.count,
    this.path = '',
  });

  PictureState copuWith({
    int? count,
    String? path,
  }) {
    return PictureState(
      count: count ?? this.count,
      path: path ?? this.path,
    );
  }

  const PictureState.init() : this(count: -1);

  @override
  List<Object?> get props => [count, path];
}

part of 'notes_cubit.dart';

sealed class NotesState extends Equatable {
  const NotesState();
}

final class NotesInitial extends NotesState {
  @override
  List<Object> get props => [];
}

final class NotesSuccess extends NotesState {
  @override
  List<Object> get props => [];
}


final class NotesLoading extends NotesState {
  @override
  List<Object> get props => [];
}

final class NotesLoaded extends NotesState {
  final List<Notes> notes;

  NotesLoaded({required this.notes});
  @override
  List<Object> get props => [notes];
}

final class NotesError extends NotesState {
  final String messageError;

  NotesError({required this.messageError});
  @override
  List<Object> get props => [messageError];
}

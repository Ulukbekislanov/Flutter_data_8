part of 'data_bloc.dart';

sealed class DataState extends Equatable {
  const DataState();
  
  @override
  List<Object?> get props => [];
}

class  DataInitial extends DataState {}

class LoadingDataState extends  DataState {}

class LoadedDataState extends  DataState {
  final List<DataModel> listData;

  const LoadedDataState({required this.listData});

  @override
  List<Object?> get props => [listData];
}

class ErrorDataState extends  DataState {}
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_21/data/data_api_server.dart';
import 'package:flutter_application_21/data/models/data_model.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final DataApiServer apiService = DataApiServer();

  DataBloc() : super(DataInitial()) {
    on<GetDataEvent>((event, emit) async {
      try {
        emit(LoadingDataState());

        final List<DataModel> data = await apiService.getData();

        emit(LoadedDataState(listData: data));
      } catch (error, stackTrace) {
        Talker().handle(error, stackTrace);
        emit(ErrorDataState());
      }
    });
  }
}

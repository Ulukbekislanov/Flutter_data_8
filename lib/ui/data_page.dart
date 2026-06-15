import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_21/ui/data/bloc/data_bloc.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final DataBloc _dataBloc = DataBloc();

  @override
  void initState() {
    super.initState();
    _dataBloc.add(GetDataEvent());
  }

  @override
  void dispose() {
    _dataBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crypto Coins',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: BlocBuilder<DataBloc, DataState>(
        bloc: _dataBloc,
        builder: (context, state) {
          if (state is LoadingDataState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is LoadedDataState) {
            return ListView.builder(
              itemCount: state.listData.length,
              itemBuilder: (context, index) {
                final coin = state.listData[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        coin.rank.toString(),
                      ),
                    ),
                    title: Text(
                      coin.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      coin.symbol,
                    ),
                    trailing: Text(
                      'ID: ${coin.id}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            );
          }

          if (state is ErrorDataState) {
            return const Center(
              child: Text(
                'Ошибка загрузки данных',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.red,
                ),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
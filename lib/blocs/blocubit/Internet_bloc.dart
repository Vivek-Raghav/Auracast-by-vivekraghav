// Assuming the existence of these states
import 'dart:async';
import 'package:auracast/blocs/event/internet_event.dart';
import 'package:auracast/blocs/state/internet_state.dart';
import "package:connectivity_plus/connectivity_plus.dart";
import 'package:auracast/core/shared/utils/library/data_connection_checked/data_connection_checker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Bloc for managing internet connectivity
class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity connectivity;
  final DataConnectionChecker dataConnectionChecker;
  StreamSubscription<ConnectivityResult>? connectivityStream;
  StreamSubscription<DataConnectionStatus>? dataConnectionStream;

  InternetBloc({
    required this.connectivity,
    required this.dataConnectionChecker,
  }) : super(InternetChecking()) {
    on<CheckConnectivity>(_onCheckConnectivity);
  }

  void _onCheckConnectivity(InternetEvent event, Emitter<InternetState> emit) {
    connectivityStream?.cancel();
    connectivityStream = connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        emit(InternetDisconnected());
      } else {
        checkActualConnection(emit);
      }
    }) as StreamSubscription<ConnectivityResult>?;
  }

  void checkActualConnection(Emitter<InternetState> emit) async {
    var actualConnection = await dataConnectionChecker.hasConnection;
    if (actualConnection) {
      emit(InternetConnected());
    } else {
      emit(InternetDisconnected());
    }
  }

  @override
  Future<void> close() {
    connectivityStream?.cancel();
    dataConnectionStream?.cancel();
    return super.close();
  }
}

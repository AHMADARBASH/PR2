import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:hotely/blocs/hotel_blocs/hotels_state.dart';
import 'package:hotely/data/models/hotel.dart';
import 'package:hotely/data/repositories/hotels_repo.dart';
import 'package:hotely/utilities/exceptions.dart';

class HotelsCubit extends Cubit<HotelsState> {
  HotelsCubit() : super(HotelsInitState());
  HotelsRepository repo = HotelsRepository();

  Future<void> getTop5Hotels() async {
    emit(HotelsLoadingState());
    final data;
    try {
      data = await repo.getTop5Hotels();
      emit(HotelsUpdatedState(data: data));
    } on HTTPException catch (e) {
      emit(HotelsErrorState(errorMessage: e.toString()));
    } on SocketException catch (_) {
      emit(HotelsErrorState(errorMessage: 'Connection Error'));
    } catch (e) {
      print(e);
      emit(HotelsErrorState(errorMessage: 'Unkown Error'));
    }
  }

  Future<void> searchForHotel() async {
    emit(HotelsLoadingState());
    final data;
    try {
      data = await repo.getTop5Hotels();
      emit(HotelsUpdatedState(data: data));
    } on HTTPException catch (e) {
      emit(HotelsErrorState(errorMessage: e.toString()));
    } on SocketException catch (_) {
      emit(HotelsErrorState(errorMessage: 'Connection Error'));
    } catch (e) {
      print(e);
      emit(HotelsErrorState(errorMessage: 'Unkown Error'));
    }
  }
}

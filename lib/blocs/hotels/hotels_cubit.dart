import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:hotely/blocs/hotels/hotels_state.dart';
import 'package:hotely/data/models/hotel.dart';
import 'package:hotely/data/repositories/hotels_repo.dart';
import 'package:hotely/utilities/exceptions.dart';

class HotelsCubit extends Cubit<HotelsState> {
  HotelsCubit() : super(HotelsInitState());
  HotelsRepository repo = HotelsRepository();

  Future<void> getTopHotels() async {
    emit(HotelsLoadingState());
    final data;
    try {
      data = await repo.getTopHotels();
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
    await Future.delayed(Duration(seconds: 3));
    List<Hotel> data = [];
    try {
      // data = await repo.getTop5Hotels();
      emit(HotelsSearchState(data: data));
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

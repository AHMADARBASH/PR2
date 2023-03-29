import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:hotely/blocs/hotels/hotels_state.dart';
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
    await Future.delayed(Duration(seconds: 3));
    List<Hotel> data = [
      Hotel(
          name: 'Sheraton',
          rate: 4.5,
          image:
              'https://images.unsplash.com/photo-1571896349842-33c89424de2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
          location: 'Syria - Damascus',
          price: 100),
      Hotel(
          name: 'Sheraton',
          rate: 4.5,
          image:
              'https://images.unsplash.com/photo-1571896349842-33c89424de2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
          location: 'Syria - Damascus',
          price: 100),
      Hotel(
          name: 'Sheraton',
          rate: 4.5,
          image:
              'https://images.unsplash.com/photo-1571896349842-33c89424de2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
          location: 'Syria - Damascus',
          price: 100),
      Hotel(
          name: 'Sheraton',
          rate: 4.5,
          image:
              'https://images.unsplash.com/photo-1571896349842-33c89424de2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
          location: 'Syria - Damascus',
          price: 100),
      Hotel(
          name: 'Sheraton',
          rate: 4.5,
          image:
              'https://images.unsplash.com/photo-1571896349842-33c89424de2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
          location: 'Syria - Damascus',
          price: 100),
    ];
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

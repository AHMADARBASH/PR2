import 'package:bloc/bloc.dart';
import 'package:hotely/blocs/bottom_nav_bar/bottom_nav_bar_states.dart';

class BottomNavBarCubit extends Cubit<BottomNavbarState> {
  BottomNavBarCubit() : super(BottomNavBarInitState());

  void changeNavBarIndex(int index) {
    state.index = index;
    emit(BottomNavBarChangeIndexState(newIndex: index));
  }
}

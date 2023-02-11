abstract class BottomNavbarState {
  int index;
  BottomNavbarState({required this.index});
}

class BottomNavBarInitState extends BottomNavbarState {
  @override
  BottomNavBarInitState() : super(index: 0);
}

class BottomNavBarChangeIndexState extends BottomNavbarState {
  int newIndex;

  @override
  BottomNavBarChangeIndexState({required this.newIndex})
      : super(index: newIndex);
}

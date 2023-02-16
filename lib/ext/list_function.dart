extension ListFunction<T> on List<Iterable<T>> {
  List<T> flatten() {
    List<T> list = [];
    for(var element in this) {
      list.addAll(element);
    }
    return list;
  }
}

extension NumberList<T extends num> on Iterable<T> {
  T sum() {
    T sum = 0 as T;
    for(T element in this) {
      sum = (sum + element) as T;
    }
    return sum;
  }
}

extension IterableFunction<T> on Iterable<T> {
  Iterable<T> whereNotNull() {
    return where((element) => element != null);
  }

  T? firstWhereOrNull(bool Function(T element) test) {
    try {
      return firstWhere(test);
    } catch (e) {
      return null;
    }
  }
}
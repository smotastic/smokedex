class MemoryHelper {
  MemoryHelper._();
  static final I = MemoryHelper._();

  final _db = <num, Map<String, dynamic>>{};

  Future<Map<num, Map<String, dynamic>>> get database async {
    return _db;
  }
}

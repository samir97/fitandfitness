abstract class BaseUserLogRepository<T> {
  Future<String> addEntry(T entry);

  Future<List<T>> getEntries();

  Future<void> updateEntry(T entry);

  Future<void> deleteEntry(String id);
}

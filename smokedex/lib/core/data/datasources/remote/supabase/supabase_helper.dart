import 'package:injectable/injectable.dart';
import 'package:smokedex/core/data/config.dart';
import 'package:supabase/supabase.dart';

@LazySingleton()
class SupabaseHelper {
  SupabaseClient? db;

  Future<SupabaseClient> get database async {
    return db ?? initDb();
  }

  SupabaseClient initDb() {
    return SupabaseClient(Config.I.get('SUPABASE_URL') ?? '',
        Config.I.get('SUPABASE_API_KEY') ?? '');
  }
}

import 'package:smokedex/core/data/config.dart';
import 'package:supabase/supabase.dart';

class SupabaseHelper {
  SupabaseHelper._();
  static final I = SupabaseHelper._();

  SupabaseClient? db;

  Future<SupabaseClient> get database async {
    return db ?? initDb();
  }

  SupabaseClient initDb() {
    return SupabaseClient(Config.I.get('SUPABASE_URL') ?? '',
        Config.I.get('SUPABASE_API_KEY') ?? '');
  }
}

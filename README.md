# Smokedex - A Pokédex based on Flutter showcasing a clean architecture approach
This Repository contains of two projects.

**Smokeapi** is an api-wrapper for the [pokeapi](https://pokeapi.co/), and is just helping in using the pokeapi for the main project, the Pokédex.

**Smokedex** is a clean architecture showcase in flutter implementing a rudimentary Pokédex with an infinite scroll and a detail view for each Pokémon.


# Tech Stack
* Flutter
* dartz - Primarly for the Either class, to represent a unified value for each usecase
* equatable - Easily find out if a model / entity is equal. Useful for noticing changes in the BloC state management
* flutter_dotenv - To enable profile based environments out of a .env file
* flutter_bloc - The state management solution
* get_it / injectable - Dependency Management
* hive / moor / sqflite - Multiple Persistence Libraries to try out multiple datasources for local caching of the shown pokémon
* supabase - Remote Caching of the shown Pokémon (just an additional datasource)
* logger - Logging in the Application
* enume - Representating the Loglevels as Strings

# Implementation
The Flutter Part of this application is very basic. It just consists of two pages, the PokemonListPage and the PokemonDetailPage. 
When you start the application, the root will always be the ListPage where the first 25 Pokémon will be loaded and shown.

First we check locally, if there are Pokémon in our cache, based on whatever DataSource we are using at the time. If yes, then just use the local cache, if not we request them remotely via the Smokeapi.
```dart
// list_pokemon_adapter.dart
@override
Future<Either<Failure, List<PokemonEntry>>> list(
    num pageSize, num offset) async {
// first check locally
final localResult = await dataSourceLocal.list(pageSize, offset);

List<PokemonModel> pokemon;
if (localResult.isRight()) {
    final localPokemon = localResult.getOrElse(() => throw UnknownFailure());
    if (localPokemon.length == pageSize) {
    pokemon = localPokemon;
    return Right(pokemon
        .map((model) => PokemonEntryMapper.instance.fromModel(model))
        .toList());
    }
}

final result = await dataSourceRemote.list(pageSize, offset);
return result.fold(
    (l) => Left(UnknownFailure()),
    (r) {
    var entries = <PokemonEntry>[];
    r.forEach((model) {
        dataSourceLocal.cache(model.id - 1, model);
        cacheDataSourceRemote.cache(model);
        entries.add(PokemonEntryMapper.instance.fromModel(model));
    });
    return Right(entries);
    },
);
}
```

These will be always requested via the ListPokemonUseCase, and handed back to the state management solution BloC.
```dart
// list_pokemon_cubit.dart
void initialLoad() async {
final result = await listPokemonUseCase(ListPokemonParams(25, 0));

result.fold((l) => emit(ListPokemonLoadErrorState(l)),
    (r) => emit(ListPokemonLoadedState(r)));
}
```
The Page then, can just render the Pokemon in a GridView.
```dart
// pokedex_page.dart
@override
Widget build(BuildContext context) {
    return Scaffold( // ... ),
        body: BlocBuilder<ListPokemonCubit, ListPokemonState>(
            builder: (context, state) {
        // ...
        if (state is ListPokemonLoadedState) {
            return GridView.builder(
            // ... render state.pokemons
            );
        }
        // ...
        }),
    );
}
```

Then Clicking a Pokemon, the pokemon_detail_page will be shown.
## Infinite Scroll
Then reaching the end of the current List of Pokémons, the next page of pokémons will be requested.
```dart
if (i >= state.pokemons.length) {
    BlocProvider.of<ListPokemonCubit>(context).requestNextPage();
    return Center(child: CircularProgressIndicator());
}
```
The GridView in turn will always render one more entry, than was requested.
```dart
return GridView.builder(
    // ...
    itemCount: state.pokemons.length + 1
);
```
The Cubit will just add the next pokemon to the current state of pokemons.
```dart
void requestNextPage() async {
    final _state = state;
    if (_state is ListPokemonLoadedState) {
        final curPokemons = _state.pokemons;
        final result =
            await listPokemonUseCase(ListPokemonParams(25, curPokemons.length));
        result.fold((l) => emit(ListPokemonLoadErrorState(l)), (r) {
        return emit(ListPokemonLoadedState([...curPokemons, ...r]));
        });
    }
}
```
## Multiple Datasources
We are using multiple datasources (hive, sqflite, moor) for local caching, but only one will be always active.
This is achieved by an Environment Filter in get_it, which will be created by using the environments in .env via flutter_dotenv.
```dart
// main.dart
final String dataSourceEnv = fetchDataSourceByDevice();
await configureDependencies({
    DeviceSegment.currentDevice.name,
    dataSourceEnv,
});

String fetchDataSourceByDevice() {
  String ret = memory.name; // default
  if (DeviceSegment.currentDevice.isMobile()) {
    ret = Config.I.get('LOCAL_DATASOURCE_MOBILE') ?? hive.name;
  } else if (DeviceSegment.currentDevice.isWeb()) {
    ret = Config.I.get('LOCAL_DATASOURCE_WEB') ?? hive.name;
  }
  return ret;
}
```
```
# .env
LOCAL_DATASOURCE_MOBILE=hive
LOCAL_DATASOURCE_WEB=memory
```
Now based on the current Device, and Environment we can inject the correct datasource.
Each datasource must be marked for the according environment.
```dart
@hive
@LazySingleton(as: ListPokemonDataSourceLocal)
class ListPokemonDataSourceLocalHive extends ListPokemonDataSourceLocal {...}

@moor
@LazySingleton(as: ListPokemonDataSourceLocal)
class ListPokemonDataSourceLocalMoor extends ListPokemonDataSourceLocal {...}

@sqflite
@LazySingleton(as: ListPokemonDataSourceLocal)
class ListPokemonDataSourceLocalSqflite extends ListPokemonDataSourceLocal {...}
```

## Environments

## Logger
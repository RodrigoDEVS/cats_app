import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gatos_app/presentation/screens/detail_page.dart';
import 'package:gatos_app/presentation/widgets/custom_rich_text.dart';

import 'bloc/home_page_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Disparar el evento para obtener la lista de gatos al iniciar la pantalla
    context.read<HomePageBloc>().add(GetBreedsEvent());
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('Catbreeds'))),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Buscar',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onFieldSubmitted: (value) {
                // Si el campo de búsqueda está vacío, se obtiene la lista completa
                if (value.isEmpty) {
                  context.read<HomePageBloc>().add(GetBreedsEvent());
                  return;
                }
                // Si hay texto en el campo de búsqueda, se filtran los gatos por nombre
                context.read<HomePageBloc>().add(GetBreedsByNameEvent(value));
              },
            ),
          ),
          Expanded(
            child: Center(
              child: BlocBuilder<HomePageBloc, HomePageState>(
                builder: (context, state) {
                  if (state is HomePageLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomePageLoaded) {
                    final breeds = state.breedsList;
                    return ListView.builder(
                      itemCount: breeds.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.deepPurple.shade200,
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      breeds[index].name ?? "",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => DetailPage(
                                                  breed: breeds[index],
                                                ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Más...",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.blue[900],
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Hero(
                                  tag: breeds[index].id ?? "",
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      breeds[index].image?.url ?? "",
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const Icon(
                                                Icons.broken_image,
                                                size: 80,
                                              ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomRichText(
                                      titulo: "Pais de Origen: ",
                                      contenido: breeds[index].origin ?? "",
                                    ),
                                    CustomRichText(
                                      titulo: "Inteligencia: ",
                                      contenido:
                                          "${breeds[index].intelligence ?? ""}",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is HomePageError) {
                    return Center(child: Text('Error: ${state.message}'));
                  }
                  return const Center(child: Text('Aun no hay gatos cargados'));
                },
              ),
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}

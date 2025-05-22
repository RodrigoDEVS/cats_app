import 'package:flutter/material.dart';
import 'package:gatos_app/data/models/breeds_model.dart';

class DetailPage extends StatelessWidget {
  final BreedsModel breed;
  const DetailPage({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(title: Text(breed.name ?? 'No name')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Hero(
              tag: breed.id ?? '',
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image(image: NetworkImage(breed.image?.url ?? '')),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Scrollbar(
                controller: scrollController,
                thumbVisibility: true,
                interactive: true,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        breed.description ?? 'No description',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Temperament: ${breed.temperament ?? 'No temperament'}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Origin: ${breed.origin ?? 'No origin'}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Life Span: ${breed.lifeSpan ?? 'No span'}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Adaptability: ${breed.adaptability ?? 'No adaptability'}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Affection Level: ${breed.affectionLevel ?? 'No affection'}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Child Friendly: ${breed.childFriendly ?? 'No child friendly'}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Dog Friendly: ${breed.dogFriendly ?? 'No dog friendly'}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Energy Level: ${breed.energyLevel ?? 'No energy'}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Grooming: ${breed.grooming ?? 'No grooming'}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Health Issues: ${breed.healthIssues ?? 'No health issues'}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Intelligence: ${breed.intelligence ?? 'No intelligence'}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Shedding Level: ${breed.sheddingLevel ?? 'No shedding'}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Social Needs: ${breed.socialNeeds ?? 'No social needs'}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Stranger Friendly: ${breed.strangerFriendly ?? 'No stranger friendly'}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

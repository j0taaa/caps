import 'package:flutter/material.dart';
import 'package:caps/components/CapsBottomNavigationBar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  // Exemplo de perfis já pesquisados
  final List<Map<String, String>> _recentProfiles = [
    {
      'name': 'Henrique Ol',
      'username': '@pieceofhell',
      'avatarUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSzLCJqIVmPVFfJO__PJaWdRmjbcARyk3gmA&s',
    },
    {
      'name': 'Jota',
      'username': '@jo.ta',
      'avatarUrl':
          'https://as1.ftcdn.net/v2/jpg/00/76/29/96/1000_F_76299657_yiu0sfVGVLPrGILaKxvlENb5GY3ge5oS.jpg',
    },
    {
      'name': 'Guilherme',
      'username': '@guiderodrig...',
      'avatarUrl':
          'https://image-cdn-ak.spotifycdn.com/image/ab67706c0000da845982800a0a6bbbecfaf5724e',
    },
    {
      'name': 'Larissa',
      'username': '@mariella_lari',
      'avatarUrl':
          'https://www.acouguebomboi.com.br/wp-content/uploads/2021/04/linguica-toscana-bomboi-mercado-de-carnes-rio-de-janeiro.jpg',
    },
    {
      'name': 'Choque',
      'username': '@choque',
      'avatarUrl':
          'https://upload.wikimedia.org/wikipedia/commons/d/da/Choquei.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight:
            0, // Esconde a AppBar padrão, pois estamos movendo a barra de pesquisa para o AspectRatio
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1080 / 1350, // Mantém a proporção 400x900
          child: Column(
            children: [
              // Barra de pesquisa dentro do AspectRatio
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(Icons.search, color: Colors.grey),
                            ),
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                onTap: () {
                                  setState(() {
                                    _isSearching = true;
                                  });
                                },
                                decoration: const InputDecoration(
                                  hintText: "Pesquisar",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            if (_isSearching)
                              IconButton(
                                icon:
                                    const Icon(Icons.close, color: Colors.grey),
                                onPressed: () {
                                  setState(() {
                                    _searchController.clear();
                                    _isSearching = false;
                                  });
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                    if (_isSearching)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            _isSearching = false;
                          });
                        },
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(color: Colors.purple),
                        ),
                      )
                    else
                      IconButton(
                        icon: const Icon(Icons.person_add, color: Colors.grey),
                        onPressed: () {
                          // Ação ao pressionar o botão de adicionar pessoa
                        },
                      ),
                  ],
                ),
              ),
              // O conteúdo abaixo deve ser flexível e rolável dentro da proporção
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_recentProfiles.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Pesquisado recentemente',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close, color: Colors.grey),
                              onPressed: () {
                                setState(() {
                                  _recentProfiles
                                      .clear(); // Limpa a lista de perfis pesquisados
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 10),
                    // Lista de perfis recentemente pesquisados com scroll horizontal
                    SizedBox(
                      height: 90, // Define a altura da barra de perfis
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal, // Scroll horizontal
                        itemCount: _recentProfiles.length,
                        itemBuilder: (context, index) {
                          final profile = _recentProfiles[index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      NetworkImage(profile['avatarUrl']!),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  profile['name']!,
                                  style: const TextStyle(fontSize: 12),
                                ),
                                Text(
                                  profile['username']!,
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(),
                    // Usamos o Flexible para garantir que o restante do conteúdo seja rolável
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        child: _searchController.text.isNotEmpty
                            ? SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Resultados para "${_searchController.text}"',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // Aqui podem ser exibidos os resultados da pesquisa
                                  ],
                                ),
                              )
                            : const Center(
                                child: Text('Nenhum resultado encontrado.')),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CapsBottomNavigationBar(currentIndex: 1),
    );
  }
}

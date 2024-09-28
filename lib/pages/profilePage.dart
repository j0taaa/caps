import 'package:flutter/material.dart';
import 'package:caps/components/CapsBottomNavigationBar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Ícone de seta para a esquerda
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        title: const Text('Meu perfil'), // Título opcional
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert), // Ícone de mais opções
            onPressed: () {
              // ação ao pressionar o ícone de mais opções
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double availableHeight = constraints.maxHeight;

          return Center(
            child: AspectRatio(
              aspectRatio: 1080 / 1350,
              child: Container(
                color: const Color.fromARGB(
                    255, 255, 255, 255), // Cor de fundo para visualização
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Stack para permitir a sobreposição da imagem de perfil
                      Stack(
                        clipBehavior: Clip
                            .none, // Para permitir a sobreposição da imagem de perfil
                        children: [
                          // Banner
                          Container(
                            height: availableHeight *
                                0.2, // Proporcional à altura disponível
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a259e2b8-1e02-494b-9dcd-fb78d3e0d194/d72uu3s-df88a7b6-797f-48be-99bf-65ab7eafb0ab.jpg/v1/fill/w_851,h_315,q_75,strp/free_shadow_the_hedgehog_facebook_banner_by_darkrainbowstorm_d72uu3s-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MzE1IiwicGF0aCI6IlwvZlwvYTI1OWUyYjgtMWUwMi00OTRiLTlkY2QtZmI3OGQzZTBkMTk0XC9kNzJ1dTNzLWRmODhhN2I2LTc5N2YtNDhiZS05OWJmLTY1YWI3ZWFmYjBhYi5qcGciLCJ3aWR0aCI6Ijw9ODUxIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.6W0QkWXn7x0npGjt2niyyvy19o6eJO0B8cbPLuVNINA', // URL do banner
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Imagem de perfil com borda branca
                          Positioned(
                            bottom:
                                -40, // Define a posição para que a imagem sobreponha o banner
                            left: 16,
                            child: Container(
                              padding: const EdgeInsets.all(
                                  4), // Espaçamento para a borda
                              decoration: BoxDecoration(
                                color: Colors.white, // Cor da borda
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                  'https://image.geekship.com.br/eXoTu-V9o9AmMSXhf10V_bGLECw=/1280x960/smart/filters:strip_icc():format(webp)/hull.geekship.com.br/wp-content/uploads/2024/08/Sonic-3-mostra-Shadow-confrontando-Sonic-Tales-e-Knucle.jpg', // URL da imagem de perfil
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                          height: 40), // Espaço abaixo da imagem de perfil

                      // Texto com informações do perfil
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Nome do Perfil
                                  const Text(
                                    'Caps',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  // Nome de Usuário
                                  const Text(
                                    '@caps',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Botão de editar perfil
                            TextButton(
                              onPressed: () {
                                // Ação do botão
                              },
                              style: TextButton.styleFrom(
                                foregroundColor:
                                    Colors.purple, // Define a cor do texto
                              ),
                              child: const Text('Editar perfil'),
                            ),
                          ],
                        ),
                      ),
                      // Informações adicionais do perfil
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Conta oficial da mais nova rede social, Flutter, Laboratório de Dispositíveis Móveis',
                              style: TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'caps.io  •  Entrou em setembro de 2024',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.purple),
                            ),
                            const SizedBox(height: 12),
                            // Informações de seguidores
                            Row(
                              children: [
                                const Text(
                                  '217 Following',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 16),
                                const Text(
                                  '118 Followers',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Adicionando os 4 TextButtons
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                // Ação do botão
                              },
                              style: TextButton.styleFrom(
                                foregroundColor:
                                    Colors.purple, // Define a cor do texto
                              ),
                              child: const Text('Posts'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Ação do botão
                              },
                              style: TextButton.styleFrom(
                                foregroundColor:
                                    Colors.purple, // Define a cor do texto
                              ),
                              child: const Text('Posts e respostas'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Ação do botão
                              },
                              style: TextButton.styleFrom(
                                foregroundColor:
                                    Colors.purple, // Define a cor do texto
                              ),
                              child: const Text('Mídia'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Ação do botão
                              },
                              style: TextButton.styleFrom(
                                foregroundColor:
                                    Colors.purple, // Define a cor do texto
                              ),
                              child: const Text('Likes'),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),

                      // Conteúdo como postagens
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            PostWidget(
                              name: 'Caps',
                              username: '@caps',
                              date: '2/09/24',
                              content: 'Confira o nosso projeto!',
                              imageUrl:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUgTuvD4krMwJ_wz_WcZSgVnAoiRN5oqnYRA&s',
                            ),
                            PostWidget(
                              name: 'Caps',
                              username: '@caps',
                              date: '2/09/24',
                              content: '',
                              imageUrl:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu4G9WeeU4t88q9iulmQ97Dxo8i6R3TodDFhHyngSM2_mDsCdxG2KLH7t1mziIv7in8YQ&usqp=CAU',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const CapsBottomNavigationBar(currentIndex: 4),
    );
  }
}

class PostWidget extends StatelessWidget {
  final String name;
  final String username;
  final String date;
  final String content;
  final String imageUrl;

  const PostWidget({
    required this.name,
    required this.username,
    required this.date,
    required this.content,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://image.geekship.com.br/eXoTu-V9o9AmMSXhf10V_bGLECw=/1280x960/smart/filters:strip_icc():format(webp)/hull.geekship.com.br/wp-content/uploads/2024/08/Sonic-3-mostra-Shadow-confrontando-Sonic-Tales-e-Knucle.jpg'),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name, // Exibe o nome do usuário
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  username, // Exibe o @username
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date, // Exibe a data
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        if (content.isNotEmpty) Text(content),
        const SizedBox(height: 10),
        Image.network(imageUrl),
        const Divider(),
      ],
    );
  }
}

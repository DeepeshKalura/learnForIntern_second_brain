import 'song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });

  static List<Playlist> playlists = [
    Playlist(
      title: 'Kalish Kher',
      songs: Song.songs,
      imageUrl:
          'https://images.unsplash.com/photo-1606967365396-f6b8765c68cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
    ),
    Playlist(
      title: 'Adiyogi',
      songs: Song.songs,
      imageUrl:
          'https://images.unsplash.com/photo-1609609830354-8f615d61b9c8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1931&q=80',
    ),
    Playlist(
      title: 'Shiva Tandav',
      songs: Song.songs,
      imageUrl:
          'https://images.unsplash.com/photo-1642774667024-e9e2f37914d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c2hpdmF8ZW58MHx8MHx8fDI%3D&auto=format&fit=crop&w=500&q=60',
    )
  ];
}

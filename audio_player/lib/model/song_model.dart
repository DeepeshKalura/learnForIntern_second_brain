class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });

  static List<Song> songs = [
    Song(
      title: 'Om Namah Shivay',
      description: 'Agam Shiv Dun',
      url: 'assets/music/omNamahShivay.mp3',
      coverUrl: 'assets/images/omNamahShivay.jpg',
    ),
    Song(
      title: 'Namo Namo',
      description: 'Amit Trivedi, Sushant Rajput',
      url: 'assets/music/namoNamo.mp3',
      coverUrl: 'assets/images/namoNamo.jpg',
    ),
    Song(
      title: 'Devo Ke Dev',
      description: 'Kalish Kher',
      url: 'assets/music/devoKeDev.mp3',
      coverUrl: 'assets/images/devonKeDev.jpg',
    )
  ];
}

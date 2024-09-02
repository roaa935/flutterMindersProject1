import 'package:flutter/material.dart';
import 'movie_details_page.dart';

class HomePage extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  HomePage({required this.toggleTheme, required this.isDarkMode});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      MovieListPage(),
      FavoritesPage(),
      AccountPage(
        toggleTheme: widget.toggleTheme,
        isDarkMode: widget.isDarkMode,
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 2) {
        _widgetOptions[2] = AccountPage(
          toggleTheme: widget.toggleTheme,
          isDarkMode: widget.isDarkMode,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieMania'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search movies...',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'My Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF83B9E4), // Update color as needed
        onTap: _onItemTapped,
      ),
    );
  }
}


class MovieListPage extends StatelessWidget {
  final List<Map<String, String>> popularMovies = [
    {
      'title': 'Popular Movie 1',
      'description': 'Description of Popular Movie 1',
      'image': 'assets/popular1.jpg',
      'release date' : 'date',
      'rating' :'rate'
    },
    {
      'title': 'Popular Movie 2',
      'description': 'Description of Popular Movie 2',
      'image': 'assets/popular2.jpg',
      'release date' : 'date',
      'rating' :'rate'
    },
    {
      'title': 'Popular Movie 3',
      'description': 'Description of Popular Movie 3',
      'image': 'assets/popular3.jpg',
      'release date' : 'date',
      'rating' :'rate'
    },
  ];

  final List<Map<String, String>> SookySeason = [
    {
      'title': 'Corpse Bride',
      'description': 'Description of New Release 1',
      'image': 'assets/corpseBride.jpg',
      'release date' : 'date',
      'rating' :'rate'
    },
    {
      'title': 'Edward Sctssorhands',
      'description': 'Description of New Release 2',
      'image': 'assets/edwardSctssorhands.jpg',
      'release date' : 'date',
      'rating' :'rate'
    },
    {
      'title': 'coraline',
      'description': 'Description of New Release 3',
      'image': 'assets/coraline.jpg',
      'release date' : 'date',
      'rating' :'rate'
    },
  ];

  final List<Map<String, String>> anime = [
    {
      'title': 'A Silent Voice',
      'description': 'Description of Trending Movie 1',
      'image': 'assets/aSilentVoice.jpg',
      'release date' : 'date',
      'rating' :'rate'
    },
    {
      'title': 'kiki',
      'description': 'Description of Trending Movie 2',
      'image': 'assets/kiki.jpg',
      'release date' : 'date',
      'rating' :'rate'
    },
    {
      'title': 'ponyo',
      'description': 'Description of Trending Movie 3',
      'image': 'assets/ponyo.jpg',
      'release date' : 'date',
      'rating' :'rate'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CategoryRow(
          categoryTitle: "Popular Movies",
          movies: popularMovies,
        ),
        CategoryRow(
          categoryTitle: "Sooky Season",
          movies: SookySeason,
        ),
        CategoryRow(
          categoryTitle: "Anime",
          movies: anime,
        ),
      ],
    );
  }
}

class CategoryRow extends StatelessWidget {
  final String categoryTitle;
  final List<Map<String, String>> movies;

  CategoryRow({
    required this.categoryTitle,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            categoryTitle,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailsPage(
                        title: movie['title']!,
                        description: movie['description']!,
                        imageUrl: movie['image']!,
                      ),
                    ),
                  );
                },
                onDoubleTap: () {
                  // Add to favorites functionality
                },
                child: Container(
                  width: 120,
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      image: AssetImage(movie['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.black54,
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        movie['title']!,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}


class AccountPage extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  AccountPage({required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('User account details page.'),
          SwitchListTile(
            title: Text('Dark Mode'),
            value: isDarkMode,
            onChanged: (value) {
              toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Your favorite movies will be displayed here.'),
    );
  }
}

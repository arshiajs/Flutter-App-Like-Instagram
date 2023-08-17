import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitteld7/article.dart';
import 'carousel/carousel_slider.dart';
import 'data.dart';
import 'gen/assets.gen.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final stories = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Hi, Arshiajs", style: themeData.textTheme.titleMedium,),
                    Assets.img.icons.notification.image(width: 30, ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,),
                child: Text("Flutter Developer", style: themeData.textTheme.titleLarge,),
              ),
              const SizedBox(height: 20,),
              _StoryList(stories: stories),
              _CategoryList(),
              _PostList(),
            ],

          ),
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categories=AppDatabase.categories;

    return CarouselSlider.builder(

      itemCount: categories.length,
      itemBuilder: (context, index, realIndex){
        return _CategoryItem(

            category: categories[index]
        );
      },
      options: CarouselOptions(
        viewportFraction: 0.8,
        scrollDirection: Axis.horizontal,
        aspectRatio: 1.2,
        initialPage: 0,
        scrollPhysics: const BouncingScrollPhysics(),
        disableCenter: true,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        // autoPlay: true,
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final Category category;

  const _CategoryItem({
    super.key, required this.category,

  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            top: 101,
            right: 60,
            left: 50,
            bottom: 10,

            child: Container(
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Color(0xaa0D253C),
                    )
                  ]
              ),
            )
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.amber
          ),
          foregroundDecoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient:  const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [
                  Color(0xff0D253C),
                  Colors.transparent,
                ]),
          ),
          margin: EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.asset(
              'assets/img/posts/large/${category.imageFileName}',
              fit: BoxFit.cover,

            ),
          ),
        ),

        Positioned(
          bottom: 50,
          left: 32,
          child: Text(category.title, style: Theme.of(context).textTheme.titleLarge?.apply(color: Colors.white,
          ),
          ),
        ),
      ],
    );
  }
}

class _StoryList extends StatelessWidget {
  _StoryList({
    required this.stories,
  });

  final List<StoryData> stories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 110,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: stories.length,
          itemBuilder: (context, index){
            final story = stories[index];
            return _Story(story: story);
          }
      ),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    required this.story,
  });

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed ? _profileImageViewed() : _profileImageNormal(),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset("assets/img/icons/${story.iconFileName}",
                  width: 25,
                ),
              )
            ],
          ),
          const SizedBox(height: 8,),
          Text(story.name, style: Theme.of(context).textTheme.titleSmall),
        ],
      ),
    );
  }

  Container _profileImageNormal() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Color(0xff376AED),
              Color(0xff49B0E2),
              Color(0xff9CECFB),
            ]),
      ),
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),
        padding: const EdgeInsets.all(3),
        child: _profileImage(),
      ),
    );
  }
  Widget _profileImageViewed() {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        radius: Radius.circular(24),
        color: const Color(0xff7B8BB2),
        dashPattern: [ 5,3],
        padding: EdgeInsets.all(4),
        child: Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: _profileImage(),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.asset('assets/img/stories/${story.imageFileName}'
        )
    );
  }
}

class _PostList extends StatelessWidget {
  const _PostList({super.key});

  @override
  Widget build(BuildContext context) {
    final posts= AppDatabase.posts;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Latest news",
                style: Theme.of(context).textTheme.titleLarge,),
              TextButton(onPressed: (){},
                child: Text("More",
                  style: Theme.of(context).textTheme.titleMedium?.apply(color: Colors.blueAccent),
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
            itemCount: posts.length,
            itemExtent: 151,
            shrinkWrap: true,
            //for scrolling whole the page
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index){
              final post = posts[index];
              return Post(post: post);

            }
        )

      ],
    );
  }
}

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.post,
  });

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArtcileScreen()));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
        decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 16,
                  color: Color(0x1a5282FF)
              )
            ]
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset('assets/img/posts/small/${post.imageFileName}', width: 100,),

            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(post.caption, style: Theme.of(context).textTheme.titleLarge,),
                    const SizedBox(height: 10,),
                    Text(post.title, style: Theme.of(context).textTheme.titleSmall,),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        const Icon(CupertinoIcons.hand_thumbsup, size: 20,color: Colors.blueAccent,),
                        const SizedBox(width: 6,),
                        Text(post.likes,),
                        const SizedBox(width: 15,),
                        const Icon(CupertinoIcons.clock, size: 17,),
                        const SizedBox(width: 3,),
                        Text(post.time),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.only(right: 5),
                            child:  Icon( post.isBookmarked ?CupertinoIcons.bookmark_fill : CupertinoIcons.bookmark, size: 17,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class FakeRespository {
  Future<List<String>> get offerBanners async {
    return Future.delayed(Duration(seconds: 2), () {
      return [
        'https://pbs.twimg.com/media/Da5muZxV4AAAdRh.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTijOQ8B8efdniK3OSWmDlsEFDrjA8vuUeH6g&usqp=CAU',
        'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/restaurant-burger-offer-advert-header-food-design-template-ebfe19745abc19a9955744cd46623bf1_screen.jpg?ts=1595608871',
      ];
    });
  }

  Future<List<String>> get pizzas async {
    return Future.delayed(Duration(seconds: 2), () {
      return [
        'https://d1ralsognjng37.cloudfront.net/9e1ce273-6905-49b3-a936-4dbed6342ed6.jpeg',
        'https://previews.123rf.com/images/bhofack2/bhofack21801/bhofack2180100408/93753086-delicious-homemade-cheese-pizza-cut-into-square-slices.jpg',
        'https://c50f68786c.nxcli.net/wp-content/uploads/2020/11/pizza-round-or-square-market-research.jpg',
        'https://b.zmtcdn.com/data/pictures/chains/3/43833/57ddda060db21eda5f4e242cdc09e013.jpg?fit=around|771.75:416.25&crop=771.75:416.25;*,*',
        'https://images.unsplash.com/photo-1607290817806-e93c813ff329?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3F1YXJlJTIwcGl6emF8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
      ];
    });
  }
}

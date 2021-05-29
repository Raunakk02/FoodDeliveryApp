class FakeRespository {
  List<Map<String, Object>> cart = [];

  static Future<List<String>> get offerBanners async {
    return Future.delayed(Duration(seconds: 2), () {
      return [
        'https://pbs.twimg.com/media/Da5muZxV4AAAdRh.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTijOQ8B8efdniK3OSWmDlsEFDrjA8vuUeH6g&usqp=CAU',
        'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/restaurant-burger-offer-advert-header-food-design-template-ebfe19745abc19a9955744cd46623bf1_screen.jpg?ts=1595608871',
      ];
    });
  }

  static Future<List<Map<String, Object>>> get items async {
    return Future.delayed(Duration(seconds: 2), () {
      return [
        {
          'id': 'euritueywi',
          'type': 'pizza',
          'name': 'Deluxe',
          'description': 'Chicken ham, pepperoni, tomato sauce, spicy chorizo, and mozzarella',
          'price': 45.0,
          'metric': 120,
          'unit': 'grams',
          'url': 'https://d1ralsognjng37.cloudfront.net/9e1ce273-6905-49b3-a936-4dbed6342ed6.jpeg',
        },
        {
          'id': 'ieirutyeow',
          'type': 'pizza',
          'name': 'Veggie',
          'description': 'Onion, pepperoni, tomato sauce, spicy chorizo, and mozzarella',
          'price': 40.0,
          'metric': 124,
          'unit': 'grams',
          'url':
              'https://previews.123rf.com/images/bhofack2/bhofack21801/bhofack2180100408/93753086-delicious-homemade-cheese-pizza-cut-into-square-slices.jpg',
        },
        {
          'id': 'rrrrtttyui',
          'type': 'pizza',
          'name': 'Cheese Burst',
          'description': 'Cheese, tomato sauce, spicy chorizo, and mozzarella',
          'price': 37.0,
          'metric': 150,
          'unit': 'grams',
          'url':
              'https://c50f68786c.nxcli.net/wp-content/uploads/2020/11/pizza-round-or-square-market-research.jpg',
        },
        {
          'id': 'oiypjfkalc',
          'type': 'pizza',
          'name': 'Veggie Delight',
          'description': 'Pepper, tomato sauce, veggies, and mozzarella',
          'price': 20.0,
          'metric': 125,
          'unit': 'grams',
          'url':
              'https://b.zmtcdn.com/data/pictures/chains/3/43833/57ddda060db21eda5f4e242cdc09e013.jpg?fit=around|771.75:416.25&crop=771.75:416.25;*,*',
        },
        {
          'id': 'iimmvhdlla',
          'type': 'pizza',
          'name': 'Fresh Farm',
          'description': 'Beans, tomato sauce, onion, and mozzarella',
          'price': 37.0,
          'metric': 150,
          'unit': 'grams',
          'url':
              'https://images.unsplash.com/photo-1607290817806-e93c813ff329?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3F1YXJlJTIwcGl6emF8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
        },
        {
          'id': 'cbdnalchfg',
          'type': 'drinks',
          'name': 'Refreshers',
          'description': 'Chilled and refreshing',
          'price': 20.0,
          'metric': 750,
          'unit': 'ml',
          'url':
              'https://venturablvd.goldenstate.is/wp-content/uploads/2017/11/Square-Bar-Cafe-Split-Cup.jpg'
        },
        {
          'id': 'ljkzdautuv',
          'type': 'drinks',
          'name': 'Boosters',
          'description': 'Rejuvinating',
          'price': 25.0,
          'metric': 250,
          'unit': 'ml',
          'url': 'https://i.pinimg.com/originals/d2/b7/81/d2b781b19a7720109abfa396bfa3c75a.jpg'
        },
        {
          'id': 'asdkljcndj',
          'type': 'drinks',
          'name': 'Staps',
          'description': 'Cool and light',
          'price': 35.0,
          'metric': 100,
          'unit': 'ml',
          'url':
              'https://hips.hearstapps.com/del.h-cdn.co/assets/16/17/1280x1280/square-1461679547-shot-1-260.jpg?resize=480:*'
        },
        {
          'id': 'ghfjdkeicm',
          'type': 'drinks',
          'name': 'Rollers',
          'description': 'Chilled and refreshing',
          'price': 18.0,
          'metric': 500,
          'unit': 'ml',
          'url':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTavSVvkVt5_oZBomPiYIAJ_MiXaHlDxLTGdA&usqp=CAU'
        },
        {
          'id': 'fhgjvbtyqp',
          'type': 'drinks',
          'name': 'Refreshers Reloaded',
          'description': 'Chilled and refreshing',
          'price': 20.0,
          'metric': 750,
          'unit': 'ml',
          'url':
              'https://alwaysusebutter.com/wp-content/uploads/2020/07/mojito-mocktail-SQUARE-5-500x375.jpg'
        },
        {
          'id': 'zxcadseqwr',
          'type': 'sushi',
          'name': 'California',
          'description': 'Farm fresh',
          'price': 450.0,
          'metric': 150,
          'unit': 'grams',
          'url':
              'https://cdn.shopify.com/s/files/1/0029/8962/products/803682-Yamaco-Sushimold-Square12_0b967d14-20cc-4245-8972-000f7fcb0ef9.jpg?v=1590561325',
        },
        {
          'id': 'zpaoqmwbtv',
          'type': 'sushi',
          'name': 'Continental',
          'description': 'United by flavours',
          'price': 600.0,
          'metric': 300,
          'unit': 'grams',
          'url': 'https://image.freepik.com/free-photo/sushi-rolls-square-plate_140725-4233.jpg',
        },
        {
          'id': 'turiwoqpap',
          'type': 'sushi',
          'name': 'Indiana',
          'description': 'Spicy and fun',
          'price': 310.0,
          'metric': 200,
          'unit': 'grams',
          'url':
              'https://media02.stockfood.com/largepreviews/MzQ2ODU2NTUx/11188921-Sushi-on-square-plates.jpg',
        },
      ];
    });
  }

  Future<void> updateCart(List<Map<String, Object>> cartItems) {
    cart = [...cartItems];
    return Future.delayed(Duration(seconds: 2));
  }

  Future<List<Map<String, Object>>> get getCartItems {
    return Future.delayed(
      Duration(seconds: 2),
      () {
        return [...cart];
      },
    );
  }
}

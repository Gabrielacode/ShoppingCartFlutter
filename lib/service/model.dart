//We will creating a model class for our Cart Item
class CartItem {
  //We will define the table name and columns as constants
  static String TABLE_NAME ='cart_item';
  static String ID_COLUMN ='_id';
  static String NAME_COLUMN ='name';
  static String PRICE_COLUMN ='price';
  static String RATING_COLUMN ='rating';

  int id ;
  String nameOfItem ;
  double price;
  int rating;

  CartItem({ this.id=0, this.nameOfItem ="",this.price = 0,this.rating =0});
  factory CartItem.fromMap(Map<String,Object?> results){
    return CartItem(
        id:results[ID_COLUMN] as int,
        nameOfItem: results[NAME_COLUMN] as String,
        price: results[PRICE_COLUMN] as double,
        rating: results[RATING_COLUMN] as int);
  }

  Map<String,Object?> toMap(){
    return{
      ID_COLUMN :id,
      NAME_COLUMN:nameOfItem,
      PRICE_COLUMN:price,
      RATING_COLUMN:rating
    };
  }

  static String createTable() =>"""
  CREATE TABLE $TABLE_NAME(
  $ID_COLUMN INTEGER PRIMARY KEY AUTOINCREMENT,
  $NAME_COLUMN TEXT NOT NULL,
  $PRICE_COLUMN REAL NOT NULL,
  $RATING_COLUMN INTEGER NOT NULL
  )
  """;

}
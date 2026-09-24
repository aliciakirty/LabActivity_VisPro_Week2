* How many widget classes did you extract, and for each one: was the trigger reuse, or readability?
  => ada 6 class yang sy extract.
  1. menu_header = Readability
  2. empty_state = Readability
  3. list_menu = Readability
  4. menu_search = Readability
  5. order_summary_bar = Readability
  6. price_tag = Reuse
* Which piece of state did you nearly push down into a child widget, and what would have broken if you had?
  => _quantities, karena menu ini digunakan di list_menu dan juga order_summary_bar. jika dipindahkan salah satu dari class tersebut tidak dapat mengaksesnya. pada list_menu diperlukan untuk mendisplay stiap menu sedangkan order_summary_bar untuk mengkalkulasi total orderan

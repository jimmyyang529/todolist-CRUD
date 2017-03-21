Item.destroy_all
item_list =[
	{"title" => "Homework","due_date" =>"2017-03-03"},
	{"title" => "2_Homework","due_date" =>"2017-03-11"}

]
item_list.each do |item|
  Item.create( :title => item["title"],  :due_date => item["due_date"])
end
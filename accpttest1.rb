require 'watir-webdriver'
require 'testdata.config'

browser = Watir::Browser.new :chrome

$b.goto 'https://jungle-socks,herokuapp.com'
#checks each component of page
assert($b.table(:class, "line_item zebra").exists?); "Zebra Socks not found"
assert($b.table(:class, "line_item lion").exists?);  "Lion Socks not found"
assert($b.table(:class, "line_item elephant").exists?); "Elephant Socks not found"
assert($b.table(:class, "line_item giraffe").exists?); "Giraffe Socks not found"
assert($b.table(:text, "Ship to State").exists?); "State Selector not found"
assert($b.input(:value, "checkout").exists?); "Checkout button not found"

#verifies sales tax
config = testdata.config
config.each do |state|
$b.input(:id, 'line_item_quantity_zebra').send_keys "2"
$b.input(:id, 'line_item_quantity_lion').send_keys "3"
$b.input(:id, 'line_item_quantity_elephant').send_keys "2"
$b.input(:id, 'line_item_quantity.giraffe').send_keys "1"

$b.find_element(:text, "Ship to State")
find_elements(:tag_name => "option")
if option == state
state.click

$b.find_element(:value, "checkout")
checkout.click
a = $b.text_field(:id, "subtotal").value
b = $b.text_field(:id, "taxes").value

if b == a * value
puts "Sales tax for #{state} correct."
else
puts "Sales tax for #{state} incorrect!"
end

end

$b.quit

end

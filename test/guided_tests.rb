$LOAD_PATH << "test"
$LOAD_PATH << "lib"

#require 'test_linked_list_item'
#require 'test_linked_list'

if ENV['ONLY_LL']
  require 'test_ll'
else
  require 'test_linked_list_item'
  require 'test_linked_list'
  require 'test_ll'
end

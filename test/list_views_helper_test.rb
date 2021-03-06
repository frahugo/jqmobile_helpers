require 'test_helper'

class ListViewHelperTest < ActiveSupport::TestCase
  include JqmobileHelpers::ListViewsHelper

  test "basic list helper" do
    jq_basic_list = basic_list(["apple", "orange"])
    assert_equal "<ul data-inset=\"true\" data-role=\"listview\"><li>apple</li><li>orange</li></ul>", jq_basic_list
  end

  test "basic linked list helper with options" do
    collection = [{:name => "Cs8", :link => "http://google.com/serach?q=Cs8"}]
    basic_list = basic_list(collection.map{|x| link_to(x[:name], x[:link])}, {'data-theme' => 'b'})
    assert_equal "<ul data-inset=\"true\" data-role=\"listview\" data-theme=\"b\"><li><a href=\"http://google.com/serach?q=Cs8\">Cs8</a></li></ul>", basic_list
  end

  test "basic numbered list helper" do
    jq_basic_list = numbered_list(["apple", "orange"])
    assert_equal "<ol data-inset=\"true\" data-role=\"listview\"><li>apple</li><li>orange</li></ol>", jq_basic_list
  end

  test "nested list helper" do
    collection = [{:title => "Bird", :link => "/birds/1"}]
    nested_list = nested_list(collection.map{|x| link_to(x[:title], x[:link])})
    assert_equal "<ul data-inset=\"true\" data-role=\"listview\"><li><ul><li><a href=\"/birds/1\">Bird</a></li></ul></li></ul>", nested_list
  end

  test "split-button list helper" do
    name = "Split Button List"
    link = "/posts/1"
    default_options = {'data-role' => "listview", 'data-split-icon' => "gear", 'data-split-theme' => "d"}
    split_options = {'data-rel' => "dialog", 'data-transition' => "slideup"}
    split_button_list = content_tag("li", content_tag(:a, name, {:href => link}.merge(split_options)))
    assert_equal "<li><a data-rel=\"dialog\" data-transition=\"slideup\" href=\"/posts/1\">Split Button List</a></li>", split_button_list
  end

  test "thumbnail list helper" do
    collection = [{:name => "Cs8", :link => "http://google.com/serach?q=Cs8"}]
    actual = thumbnail_list(collection.collect do |x|
      ['<img alt="Album-bb" src="/images/album-bb.jpg" />'.html_safe,
       link_to(x[:name], x[:link]),
       x[:name]]
    end)
    expected = "<ul data-inset=\"false\" data-role=\"listview\"><li><img alt=\"Album-bb\" src=\"/images/album-bb.jpg\" /><h3><a href=\"http://google.com/serach?q=Cs8\">Cs8</a></h3><p>Cs8</p></li></ul>"
    assert_equal expected, actual
  end

  test "will contruct basic list if thumbnail list collection items is not an array" do
    collection = [{:name => "Cs8", :link => "http://google.com/search?q=Cs8"}]
    basic_list = thumbnail_list(collection.map{|x| link_to(x[:name], x[:link])})
    assert_equal "<ul data-inset=\"false\" data-role=\"listview\"><li><a href=\"http://google.com/search?q=Cs8\">Cs8</a></li></ul>", basic_list
  end

  test "inset list helper" do
    jq_inset_list = inset_list(["car","van","truck"])
    assert_equal "<ul data-inset=\"true\" data-role=\"listview\"><li>car</li><li>van</li><li>truck</li></ul>", jq_inset_list
  end

  test "ol inset list helper" do
    jq_ol_inset_list = ol_inset_list(["car","van","truck"])
    assert_equal "<ol data-inset=\"true\" data-role=\"listview\"><li>car</li><li>van</li><li>truck</li></ol>", jq_ol_inset_list
  end
  
  #test "list divider helper" do
  #  collection = [{:title => ["A", "B", "C"], :controller => 'posts'}]
  #  jq_list_divider = list_divider(collection.group_by{|x| x[:title]}.sort, [:title])
  #  assert_equal "<ul data-role=\"listview\"><li data-role=\"list-divider\"><li><a href=\"posts/1\">A</a><li><a href=\"posts/2\">B</a><li><a href=\"posts/3\">C</a></li></ul>", jq_list_divider
  #end
end


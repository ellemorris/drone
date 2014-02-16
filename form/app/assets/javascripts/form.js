$(function() {
  var i = 1;
  $("#add-stock").on("click", function() {
    $("#stock-form").append("<label for='name'>Stock Ticker:</label><input type='text' id='name' name='stock_name[" + i + "]'><br>");
    i += 1;
  });

});
$(function() {
  var i = 1;
  $("#add-stock").on("click", function() {
    $("#stock-form").append("<label for='name' style='margin-left: 25px;'>Stock Ticker:</label><input type='text' id='name' class='form-control form-inline' placeholder='Enter Stock Ticker' style='width: 200px;' name='stock_name[" + i + "]'>");
    i += 1;
  });

});
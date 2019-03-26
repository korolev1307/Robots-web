//Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
//You can use CoffeeScript in this file: http://coffeescript.org/
$( document ).on('turbolinks:load', () => {
$.when( $.ready ).then(function(){
      goods_list = gon.goods_params;
      items_list = goods_list.map((item) => {
                   return JSON.parse(item);
                   });
      strData = JSON.stringify({
        'version': '1.0',
        'dateExecute': gon.current_date,
        'authLogin': 'zvGnm47oqbuiOojGMuTm4k37MTv7LPTe',
        'secure': gon.secure_key,
        'senderCityId': '44',
        'receiverCityId': gon.receiverCityId,
        'tariffId': '10',
        'goods': items_list
        //   [
        //     {
        //       'weight': '0.3',
        //       'length': '10',
        //       'width': '7',
        //       'height': '5'
        //     },
        //     {
        //       'weight': '0.3',
        //       'length': '10',
        //       'width': '7',
        //       'height': '5'
        //     }
        //   ]
      });
      
      $.ajax({
        url : 'http://api.cdek.ru/calculator/calculate_price_by_jsonp.php',
        jsonp : 'callback',
        type : 'GET',
        dataType : "jsonp",
        data : {
          "json": strData
        },

        success: function(data) {
          console.log(strData);
          $("#stock-price").text(data.result.price + ' ' + data.result.currency);
          $("#stock-price-hidden").val(data.result.price);
          var dateMin = new Date(data.result.deliveryDateMin);
          var dateMax = new Date(data.result.deliveryDateMax);
          dateMin = dateMin.toLocaleString(window.navigator.language, {weekday: 'long'});
          dateMax = dateMax.toLocaleString(window.navigator.language, {weekday: 'long'});
          $("#delivery-date").text(data.result.deliveryDateMin + ', ' + dateMin + ' - ' + data.result.deliveryDateMax + ', ' + dateMax);
          $("#delivery-date-hidden").val(data.result.deliveryDateMin + ', ' + dateMin + ' - ' + data.result.deliveryDateMax + ', ' + dateMax);
          console.log(data);
        }
      });
    });
});
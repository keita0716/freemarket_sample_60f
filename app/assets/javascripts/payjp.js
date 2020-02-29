$(function(){
  var form = $("#charge-form");
  Payjp.setPublicKey('pk_test_44116133413ca541987a8bea');

  $("#charge-form").on("click", "#submit-button", function(e) {
    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);
    var card = {
        number: parseInt($("#card_number").val()),
        cvc: parseInt($("#security_number").val()),
        exp_month: parseInt($("#credit_card_card_limit_month").val()),
        exp_year: parseInt($("#credit_card_card_limit_year").val())
    };
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        alert("カード情報が正しくありません。")
        form.find('button').prop('disabled', false);
      }
      else {
        $(".input-default").removeAttr("name");
        $(".security_number").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");

        var token = response.id;
        $("#charge-form").append($('<input type="hidden" name="payjp_token" class="payjp-token" />').val(token));
        $("#charge-form").get(0).submit();
        alert("登録が完了しました");
      }
    });
  });
});
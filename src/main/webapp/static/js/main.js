function showCitiesByCountry(country) {
    document.getElementById("cities").value = "dis";
    document.getElementById("style").innerHTML = '#cities :not(.' + country + ') {display:none;}';
}

function showPassword() {
    const fields = [password, passwordConfirmation]
    fields.forEach(x => {
        if (x.type === "password") {
            x.type = "text";
        } else {
            x.type = "password";
        }
    });
}

function incrementCountProduct(productName, id, hiddenPriceId) {
    var temp = document.getElementById(productName).value;
    var price = document.getElementById(id).innerHTML;
    price = price / temp;
    temp++;
    document.getElementById(productName).value = temp;
    document.getElementById(id).innerHTML = price * temp;
    document.getElementById(hiddenPriceId).value = price * temp;

}

function decrementCountProduct(productName, id, hiddenPriceId) {
    var temp = document.getElementById(productName).value;
    var price = document.getElementById(id).innerHTML;
    price = price / temp;
    temp--;
    document.getElementById(productName).value = temp;
    document.getElementById(id).innerHTML = price * temp;
    document.getElementById(hiddenPriceId).value = price * temp;
}

function countProduct(max, countProduct, hiddenPriceProduct, priceProduct) {
    var count = document.getElementById(countProduct).value;
    var hiddenPrice = document.getElementById(hiddenPriceProduct).value;

    document.getElementById(priceProduct).innerHTML = count * hiddenPrice;

    if (count < 1) {
        document.getElementById(countProduct).value = 1;
        document.getElementById(priceProduct).innerHTML = 1 * hiddenPrice;
    }
    if (count > parseInt(max)) {
        document.getElementById(countProduct).value = max;
        document.getElementById(priceProduct).innerHTML = max * hiddenPrice;
    }
}

function inBasket(id){
    document.getElementById(id).value = "В корзине";
    document.getElementById(id).className = "btn my-btn-link";
    document.getElementById(id).onclick = function() {
        document.getElementById(id).type = "link";
        location.href='/order';
    }
}




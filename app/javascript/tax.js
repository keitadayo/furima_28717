function tax() {
  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  function priceInput() {
    addTaxPrice.innerHTML = Math.floor( itemPrice.value * 0.1 ).toLocaleString()
    profit.innerHTML = Math.floor( itemPrice.value * 0.9 ).toLocaleString()
  }

  itemPrice.oninput = priceInput;
}

window.addEventListener('load', tax)
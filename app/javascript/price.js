function price () {
  const priceForm = document.getElementById("item-price")
  priceForm.addEventListener("keyup", () => {
    const price = priceForm.value
    const marginForm = document.getElementById("add-tax-price")
    const profitForm = document.getElementById("profit")
    const margin = Math.floor(price * 0.1)
    const profit = price - margin
    if (price < 10) {
      marginForm.innerHTML = 0
      profitForm.innerHTML = 0      
    } else if (price > 10) {
      marginForm.innerHTML = margin.toLocaleString()
      profitForm.innerHTML = profit.toLocaleString()
    }
  })
}
window.addEventListener("load", price)
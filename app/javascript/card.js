const pay = () => {
  const cardForm = document.getElementById("card_form")
  // cardFormがないときは、ここより下の記述を読み込ませない
  if (cardForm) {
    Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
    const form = document.getElementById("charge-form");
    form.addEventListener("submit", (e) => {
      e.preventDefault();

      const formResult = document.getElementById("charge-form");
      const formData = new FormData(formResult);

      const card = {
        number: formData.get("number"),
        cvc: formData.get("cvc"),
        exp_month: formData.get("exp_month"),
        exp_year: `20${formData.get("exp_year")}`,
      };

      Payjp.createToken(card, (status, response) => {
        if (status == 200) {
          console.log(card)
          console.log(response.id)
          const token = response.id;
          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input value=${token} name='card_token' type="hidden"> `;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
        
        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        }
      });
    });
  }
};

window.addEventListener("load", pay);
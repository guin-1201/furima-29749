const pay = () => {
  Payjp.setPublicKey("pk_test_sk_test_1c4802ede192fe2709076b4d");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    //document.getElementById("id名")は、DOMツリーから特定のHTMLの要素を取得するためのメソッド
    //マッチするidを持つHTMLの要素を取得す
    const formData = new FormData(formResult);
    //FormDataとは、フォームに入力された値を取得できるオブジェクトのこと

    const card = {
      card_number: formData.get("order[card_number]"),
      cvc_number: formData.get("order[cvc_number]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
      //statusはトークンの作成がうまくなされたかどうかを確認できる、HTTPステータスコードが入る
      //HTTPステータスコードが200のとき、すなわちうまく処理が完了したときだけ、トークンの値を取得
      //responseはそのレスポンスの内容が含まれ、response.idとすることでトークンの値を取得することができる
      const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      //HTMLのinput要素にトークンの値を埋め込み、フォームに追加
      //valueは実際に送られる値
      //nameはその値を示すプロパティ名（params[:name]のように取得できるようになる）
      //type="hidden"と書くことで、フォーム内に追加されたトークンの値を表示しないようにする。type属性の値にhiddenを指定
      //enderDom.insertAdjacentHTML("beforeend", tokenObj);でフォームの中に作成したinput要素を追加
      //insertAdjacentHTMLは、指定したHTMLなどを、特定の要素に描画できるメソッド
      //第一引数には、要素のどこに描画するのかを指定（beforeendは内部の最後の子要素の後に挿入、afterendは要素の直後に挿入、など）
      //第二引数には描画するHTML自体を渡す。予め変数に描画したいHTMLを代入しておく
    }
    });
  });
};

window.addEventListener("load", pay);


//Payjp.createToken(card, callback)
//カード情報をPAY.JP側に送りトークン化するためpay.jsが提供するオブジェクト
//第一引数は先ほど定義したcardオブジェクト
//第二引数はAY.JP側からトークンが送付された後に実行する処理を、アロー関数を用いた即時関数として記述
//即時関数とは、読み込まれると（この場合ではPAY.JPからのレスポンスがあると）即時に実行される関数
// アロー関数 ＊functionの記述を省略
//const 変数名 = () => {
//  処理
//}
const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();


    const formResult = document.getElementById("charge-form");
    //document.getElementById("id名")は、DOMツリーから特定のHTMLの要素を取得するためのメソッド
    //マッチするidを持つHTMLの要素を取得す
    const formData = new FormData(formResult);
    //FormDataとは、フォームに入力された値を取得できるオブジェクトのこと

    const card = {
      number: formData.get("user_item_order[card_number]"),
      cvc: formData.get("user_item_order[cvc_number]"),
      exp_month: formData.get("user_item_order[exp_month]"),
      exp_year: `20${formData.get("user_item_order[exp_year]")}`,
    };
    console.log(card)

    Payjp.createToken(card, (status, response) => {
    //Payjp.createToken(card, callback)
    //カード情報をPAY.JP側に送りトークン化するためpay.jsが提供するオブジェクト
    //第一引数は先ほど定義したcardオブジェクト
    //第二引数はAY.JP側からトークンが送付された後に実行する処理を、アロー関数を用いた即時関数として記述
    //即時関数とは、読み込まれると（この場合ではPAY.JPからのレスポンスがあると）即時に実行される関数
    // アロー関数 ＊functionの記述を省略
    //const 変数名 = () => {
    //  処理
    //}
      if (status === 200) {
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


    document.getElementById("card-number").removeAttribute("name");
    document.getElementById("card-cvc").removeAttribute("name");
    document.getElementById("card-exp-month").removeAttribute("name");
    document.getElementById("card-exp-year").removeAttribute("name");
    //フォームに存在するクレジットカードの各情報を削除
    //要素.removeAttribute(name, value)
    //nameは属性の名前を文字列で指定
    //valueは属性に削除したい値を指定
    //例）
      //[HTML]
      //<div class="contents" id="apple">りんご</div>
      //[JS]
      //const apple = document.getElementById("apple")
      //apple.removeAttribute("class", "contents")
      //=><div id="apple">りんご</div> が取得できる

      document.getElementById("charge-form").submit();
      //フォームの情報をサーバーサイドに送信
      //5行目のe.preventDefault();で通常のRuby on Railsにおけるフォーム送信処理はキャンセルされて
      //いるため、JavaScript側からフォームの送信処理を行う必要がある


    });
  });
};

window.addEventListener("load", pay);



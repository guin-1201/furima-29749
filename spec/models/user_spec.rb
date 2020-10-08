require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birthdayが存在すれば登録できる" do
      end
      it "パスワードは6文字以上であるこ" do
      end
      it "nicknameが6文字以下で登録できる" do
      end
      it "passwordが6文字以上であれば登録できる" do
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
      end
      it "nicknameが7文字以上であれば登録できない" do
      end
      it "emailが空では登録できない" do
      end
      it "重複したemailが存在する場合登録できない" do
      end
      it "passwordが空では登録できない" do
      end
      it "passwordが5文字以下であれば登録できない" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      end
    end
  end
end






# ## ユーザー情報
# - ***ニックネームが必須であること
# - ***メールアドレスが必須ること
# - メールアドレスが一意性であること
# - メールアドレスは@を含む必要があること
# - ***パスワードが必須であること
# - ***パスワードは6文字以上であること
# - パスワードは半角英数字混合であること
# - パスワードは確認用を含めて2回入力すること
# - 新規登録・ログイン共にエラーハンドリングができていること（適切では無い値が入力された場合、情報は受け入れられず、エラーメッセージを出力させる）

# ##本人情報確認
# - ***ユーザー本名が、名字と名前がそれぞれ必須であること
# - ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
# - ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること
# - ユーザー本名のフリガナは全角（カタカナ）で入力させること
# - ***生年月日が必須であること
require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録がうまくいくとき' do
      it "nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "a000000"
        @user.password_confirmation = "a000000"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@が存在しない場合登録できない" do
        @user.email = 'aaaaaaagmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password passwordは英字と数字の両方を含めて設定してください")
      end
      it "passwordは半角英数字混合でないと登録できない" do
        @user.password = "00000000"
        @user.password_confirmation = "00000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password passwordは英字と数字の両方を含めて設定してください")
      end
      it "passwordは半角英数字混合でないと登録できない" do
        @user.password = "aaaaaaaa"
        @user.password_confirmation = "aaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password passwordは英字と数字の両方を含めて設定してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid. Input full-width characters.")
      end
      it "last_nameは全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.last_name = "tanaka"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameは全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.first_name = "ginta"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "last_name_kanaは全角（カタカナ）でないと登録できない" do
        @user.last_name_kana = "田中"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaは全角（カタカナ）でないと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end






# ## ユーザー情報
# - ***000###000ニックネームが必須であること
# - ***000###000メールアドレスが必須ること
# - ###000メールアドレスが一意性であること
# - ###メールアドレスは@を含む必要があること
# - ***000###000パスワードが必須であること
# - ***000###000パスワードは6文字以上であること
# - ###パスワードは半角英数字混合であること
# - ###000パスワードは確認用を含めて2回入力すること
# - 新規登録・ログイン共にエラーハンドリングができていること（適切では無い値が入力された場合、情報は受け入れられず、エラーメッセージを出力させる）

# ##本人情報確認
# - ***000###000ユーザー本名が、名字と名前がそれぞれ必須であること
# - ###ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
# - ***000###000ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること
# - ###ユーザー本名のフリガナは全角（カタカナ）で入力させること
# - ***000###000生年月日が必須であること
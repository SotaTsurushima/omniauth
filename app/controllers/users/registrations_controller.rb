class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash = {})
    # 自作したメソッドを使いuidを必ず埋める
    hash[:uid] = User.create_unique_string
    super
  end

  protected
    def update_resource(resource, params)
      return super if params["password"]&.present?
      # 現在のパスワードなしでアカウントの更新をする
      resource.update_without_password(params.except("current_password"))
    end
end
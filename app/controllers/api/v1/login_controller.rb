class Api::V1::LoginController < Api::V1::BaseController
    # protect_from_forgery with: :null_session
    URL = "https://api.weixin.qq.com/sns/jscode2session".freeze

    def wechat_params
        {
            appid: "#{Figaro.env.APP_ID}",
            secret: "#{Figaro.env.APP_SECRET}",
            js_code: params[:code],
            grant_type: "authorization_code"
        }
    end

    def wechat_user
        @wechat_response ||= RestClient.post(URL, wechat_params)
        @wechat_user ||= JSON.parse(@wechat_response.body)
    end

    def login
        print 'PRINTING application.yml>>>>>>'
        # print wechat_user
        print Figaro.env.APP_ID
        print Figaro.env.APP_SECRET
        @user = User.find_or_create_by(open_id: wechat_user.fetch("openid"))
        render json: {
            userId: @user.id,
            userAvatar: @user.avatar
        }
    end
end

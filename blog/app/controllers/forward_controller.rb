require 'net/http'

class ForwardController < ApplicationController

  # 转发请求到其他服务，并返回结果
  def forward_request
    tel = params[:tel]

    # 创建一个新的HTTP请求对象
    uri = URI('https://tcc.taobao.com/cc/json/mobile_tel_segment.htm?tel=' + tel)
    logger.info "将请求转发到：" + uri.to_s

    request = Net::HTTP::Post.new(uri.path)

    # 可选：如果需要传递参数，可以设置请求的body
    # request.body = params.to_json

    # 可选：设置请求头
    request['Content-Type'] = 'application/json'

    # 发送请求并获取响应
    response = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(request)
    end

    # 处理响应
    if response.is_a?(Net::HTTPSuccess)
      # 响应成功
      render json: response.body
    else
      # 响应失败
      render json: { error: '请求转发失败' }, status: :internal_server_error
    end
  end
end

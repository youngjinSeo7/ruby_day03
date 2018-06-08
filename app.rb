require 'sinatra'
require 'sinatra/reloader'

get '/' do
    erb :app
end

get '/numbers' do
    erb :numbers
end

get '/calculate' do
    num1 = params[:n1].to_i
    num2 = params[:n2].to_i
    @sum = num1 + num2
    @min = num1 - num2
    @mul = num1 * num2
    @div = num1 / num2
    erb :calculate
end

get '/form' do
    erb :form
end

id = "multi"
pw = "campus"

post '/login' do
    if id.eql?(params[:id])
        # 비밀번호를 체크하는 로직
        if pw.eql?(params[:password])
            redirect '/complete'
        else
            redirect '/error?err_co=2'
        end
    else
        # ID가 존재하지 않습니다
        redirect '/error?err_co=1'
    end
end
# 계정이 존재하지 않거나, 비밀번호가 틀린경우
get '/error' do
    # 다른 방식으로 에러메시지를 보여줘야함
    if params[:err_co].to_i == 1
    # id가 없는 경우
    @msg = "ID가 없습니다."
    elsif params[:err_co].to_i == 2
    # pw가 틀린 경우
    @msg = "비밀번호가 틀렸습니다."
    end
    erb :error
end
# 로그인 완료된 곳
get '/complete' do
    erb :complete
end

get '/search' do
    erb :search
end

post '/search' do
    puts params[:engine]
    case params[:engine]
    when "naver"
        redirect "https://search.naver.com/search.naver?query=#{params[:query]}"
    when "google"
        redirect "https://www.google.com/search?q=#{params[:q]}"
    end
end
module SessionsHelper
    # Cria uma sessao adicionando o id do user no cookie de sessao do rails
    def log_in(user)
        session[:user_id] = user.id
    end
    
    # Se o valor de current_user for nil, significa que nao ha ninguem logado
    def logged_in?
        !current_user.nil?
    end
    
    # Se houver alguem logado (session[:user_id] != nil), ira retornar esse
    # usuario 
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    # Remove o id do usuario do cookie de sessao do rails e faz o usuario
    # corrente ser nil, caso contrario ele continuaria estando logado
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
    
    # Ao associar esse metodo a um controller, qualquer uma de suas paginas
    # relacionadas so sera acessivel se o usuario estiver logado
    def non_logged_user
        respond_to do |format|
            format.html { redirect_to login_path, alert: "faça login" }
        end if !logged_in?
    end
    
    # Ira redirecionar para a pagina do usuario logado (current_user),
    # caso ele ja esteja logado
    def logged_user
        respond_to do |format|
            format.html { redirect_to current_user, alert: "já está logado!" }
        end if logged_in?
    end
end

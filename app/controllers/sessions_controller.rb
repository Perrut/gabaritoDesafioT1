class SessionsController < ApplicationController
    # Ira executar o metodo logged_user em SessionsHelper, para impedir uma
    # tentativa de login de um usuario ja logado
    before_action :logged_user, only: [:new, :create]
    
    # Responsavel pela pagina de login
    def new
    end
    
    # Cria uma nova sessao
    def create
        user = User.find_by(email: session_params[:email])
        if user && user.authenticate(session_params[:password])
            # Metodo login do arquivo sessions_helper
            log_in user
            redirect_to user
        else
            respond_to do |format|
                format.html {redirect_to login_path, alert: 'Algo deu errado!'}
            end
        end
    end
    
    # Encerra a sessao
    def destroy
        # Metodo log_out do arquivo sessions_helper
        log_out
        redirect_to login_path
    end
    
    private
    
    # Filtro de seguranca de parametros de Session, qualquer outro parametro
    # alem desses sera ignorado
    def session_params
        params.require(:session).permit(:email, :password)
    end
end

class User < ApplicationRecord
    # Esse comando ira fazer a comparacao entre password e password_confirmation
    # e gerar a senha criptografada
    has_secure_password
    
    # Comandos para validacao de dados, presence garante que o campo deverá ser
    # preenchido, length especifica o numero de caracteres que o campo pode
    # armazenar
    validates :name, presence: true, length: { in: 2..50 }
    # uniqueness garante que dois usuarios nao terao o mesmo email
    validates :email, presence: true, length: { in: 10..100 }, uniqueness: true
    # allow_nil: true serve para o caso de se atualizar um usuario e nao
    # precisarmos inserir a senha e sua confirmacao novamente, no momento da
    # criacao, has_secure_password garante que a senha devera ser inserida
    # e nao havera usuarios sem senhas
    validates :password, presence: true, length: { in: 3..6 }, allow_nil: true
end

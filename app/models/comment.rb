class Comment < ApplicationRecord
  belongs_to :article
  
  # Validacoes de dados, presence impede que o valor do campo seja vazio,
  # length especifica um tamanho maximo e minimo para o campo
  validates :content, presence: true, length: { in: 2..200 }
end

class Article < ApplicationRecord
  belongs_to :user
  
  # Validacoes de dados, presence impede que o valor do campo seja vazio,
  # length especifica um tamanho maximo e minimo para o campo
  validates :title, presence: true, length: { in: 2..50 }
  validates :content, presence: true, length: { in: 2..200 }
end

# frozen_string_literal: true

unless Rails.env.production?
  # Criar usuario admin de dev
  User.create!(name: 'Jesher Minelli', email: 'jesherdevsk8@gmail.com', password: 'senha@123')

  # Criar os Planos de Imigração:
  ImmigrationPlan.create!([ { name: "economic" }, { name: "executive" }, { name: "firstclass" } ])

  # Criar Questionários Padrão:
  ImmigrationPlan.find_each do |plan|
    plan.questionnaires.create!(name: "Petitioner")
    plan.questionnaires.create!(name: "Beneficiary")
  end
end

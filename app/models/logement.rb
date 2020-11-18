class Logement < ApplicationRecord
    belongs_to :user
    has_one :adresse
    has_one :map
    has_one :condition
    has_many :calendriers
    has_many :equipements
    has_many :regles
    has_many :chambres
    has_many :salons
    has_many :autres
    has_many :photos
    has_many :equi_courants
    has_many :equi_familles
    has_many :equi_logistiques
    has_many :equi_securites
    has_many :equi_suplementaires
    has_many :acces_voyageurs
    has_many :ressouce_voyageurs
    has_many :parms_reservations
    has_one  :caution
    has_many :frais_suples
    has_many :bain_entier
    has_many :bain_demi
    has_many :cuisine
    has_many :kitchenette
    has_many :espace_repa
end

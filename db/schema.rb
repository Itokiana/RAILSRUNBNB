# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_16_165644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acces_voyageurs", force: :cascade do |t|
    t.string "acces"
    t.string "aide1"
    t.string "aide2"
    t.string "autre"
    t.string "presentation"
    t.string "transport"
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_acces_voyageurs_on_logement_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "adresses", force: :cascade do |t|
    t.string "pays"
    t.string "ville"
    t.string "adresse"
    t.string "code"
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_adresses_on_logement_id"
  end

  create_table "autrelits", force: :cascade do |t|
    t.string "name"
    t.integer "quantite"
    t.boolean "checked"
    t.bigint "autre_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["autre_id"], name: "index_autrelits_on_autre_id"
  end

  create_table "autres", force: :cascade do |t|
    t.string "title"
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_autres_on_logement_id"
  end

  create_table "bain_demis", force: :cascade do |t|
    t.string "title"
    t.integer "quantite"
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_bain_demis_on_logement_id"
  end

  create_table "bain_entiers", force: :cascade do |t|
    t.string "title"
    t.integer "quantite"
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_bain_entiers_on_logement_id"
  end

  create_table "calendriers", force: :cascade do |t|
    t.datetime "startDate"
    t.datetime "endDate"
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_calendriers_on_logement_id"
  end

  create_table "canapes", force: :cascade do |t|
    t.string "name"
    t.integer "quantite"
    t.boolean "checked"
    t.bigint "salon_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["salon_id"], name: "index_canapes_on_salon_id"
  end

  create_table "cautions", force: :cascade do |t|
    t.string "montant"
    t.string "type_de_payment"
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_cautions_on_logement_id"
  end

  create_table "chambres", force: :cascade do |t|
    t.string "title"
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_chambres_on_logement_id"
  end

  create_table "conditions", force: :cascade do |t|
    t.string "conditions"
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_conditions_on_logement_id"
  end

  create_table "cuisines", force: :cascade do |t|
    t.string "title"
    t.integer "quantite"
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_cuisines_on_logement_id"
  end

  create_table "equi_courants", force: :cascade do |t|
    t.string "title", default: [], array: true
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_equi_courants_on_logement_id"
  end

  create_table "equi_familles", force: :cascade do |t|
    t.string "title", default: [], array: true
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_equi_familles_on_logement_id"
  end

  create_table "equi_logistiques", force: :cascade do |t|
    t.string "title", default: [], array: true
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_equi_logistiques_on_logement_id"
  end

  create_table "equi_securites", force: :cascade do |t|
    t.string "title", default: [], array: true
    t.string "Extincteur"
    t.string "incendie"
    t.string "gaz"
    t.string "medicale"
    t.string "Police"
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_equi_securites_on_logement_id"
  end

  create_table "equi_suplementaires", force: :cascade do |t|
    t.string "title", default: [], array: true
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_equi_suplementaires_on_logement_id"
  end

  create_table "equipements", force: :cascade do |t|
    t.string "title", default: [], array: true
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_equipements_on_logement_id"
  end

  create_table "espace_repas", force: :cascade do |t|
    t.string "title"
    t.integer "quantite"
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_espace_repas_on_logement_id"
  end

  create_table "frais_suples", force: :cascade do |t|
    t.string "types"
    t.string "montant"
    t.string "facturation"
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_frais_suples_on_logement_id"
  end

  create_table "kitchenettes", force: :cascade do |t|
    t.string "title"
    t.integer "quantite"
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_kitchenettes_on_logement_id"
  end

  create_table "lits", force: :cascade do |t|
    t.string "name"
    t.integer "quantite"
    t.boolean "checked"
    t.bigint "chambre_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chambre_id"], name: "index_lits_on_chambre_id"
  end

  create_table "logements", force: :cascade do |t|
    t.string "name"
    t.string "categorie"
    t.string "types"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.string "unique"
    t.index ["user_id"], name: "index_logements_on_user_id"
  end

  create_table "maps", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_maps_on_logement_id"
  end

  create_table "parms_reservations", force: :cascade do |t|
    t.string "title", default: [], array: true
    t.string "autre"
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_parms_reservations_on_logement_id"
  end

  create_table "photos", force: :cascade do |t|
    t.json "photo"
    t.string "legend"
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_photos_on_logement_id"
  end

  create_table "regles", force: :cascade do |t|
    t.string "regle", default: [], array: true
    t.string "arrive1"
    t.string "arrive2"
    t.string "depart1"
    t.string "depart2"
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_regles_on_logement_id"
  end

  create_table "ressouce_voyageurs", force: :cascade do |t|
    t.string "title"
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_ressouce_voyageurs_on_logement_id"
  end

  create_table "salons", force: :cascade do |t|
    t.string "title"
    t.bigint "logement_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["logement_id"], name: "index_salons_on_logement_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.string "first_name"
    t.string "adresse"
    t.string "mobile"
    t.string "date_of_birth"
    t.string "sexe"
    t.string "urgence"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end

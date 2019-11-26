class Labelling < ApplicationRecord
  belongs_to :article
  belongs_to :label
end
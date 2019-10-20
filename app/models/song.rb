class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: [:release_year, :artist_name]}
    validate :has_release_year?

    def has_release_year?
        if released == false
        elsif  release_year && release_year < Date.current.year
        else
            errors.add(:release_year, "Released song must have a release year listed. Release year cannot be in the future.")
        end
    end
end

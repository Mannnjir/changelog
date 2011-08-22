module Changelog
  class Version < ActiveRecord::Base
      has_many :pivotal_stories

      before_validation :generate_name

      default_scope order('release_date DESC, major DESC, minor DESC, build DESC')

      validates_presence_of :major, :minor, :build
      validates_uniqueness_of :name

      def self.add_stories
        version_ids = self.get_used_version_ids
        empty_release_versions = (version_ids.present? ? Changelog::Version.where('id NOT IN (:version_ids)', {:version_ids => version_ids}) : Changelog::Version.all)
        empty_release_versions.each do |release_version|
          Changelog::PivotalStory.store_pivotal_stories(release_version.name, release_version.id)
        end
      end

      def self.rebuild_release_versions
        p "#{Changelog::PivotalStory.delete_all} deleted."
        Changelog::Version.add_stories
      end

      def self.latest
        version_ids = self.get_used_version_ids
        Changelog::Version.where('id IN (:version_ids)', {:version_ids => version_ids}).first if version_ids.present?
      end

      def self.with_stories
        version_ids = self.get_used_version_ids
        Changelog::Version.where('id IN (:version_ids)', {:version_ids => version_ids}) if version_ids.present?
      end

      private

      def generate_name
        self.name = "#{self.major}.#{self.minor}.#{self.build}"
      end

      def self.get_used_version_ids
        version_ids = Changelog::PivotalStory.select('DISTINCT version_id').map(&:version_id)
      end
  end
end
# == Schema Information
#
# Table name: versions
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  major        :integer
#  minor        :integer
#  build        :integer
#  release_date :date
#  created_at   :datetime
#  updated_at   :datetime
#


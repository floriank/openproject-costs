#-- copyright
# OpenProject Costs Plugin
#
# Copyright (C) 2009 - 2014 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# version 3.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#++

module OpenProject::Costs::Patches::ProjectPatch
  def self.included(base) # :nodoc:
    # Same as typing in the class
    base.class_eval do
      unloadable

      has_many :cost_objects, :dependent => :destroy
      has_many :rates, :class_name => 'HourlyRate'

      has_many :member_groups, :class_name => 'Member',
                               :include => :principal,
                               :conditions => "#{Principal.table_name}.type='Group'"
      has_many :groups, :through => :member_groups, :source => :principal
    end

  end
end

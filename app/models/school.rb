class School < ApplicationRecord

  # belongs_to :locations

  # School images
  mount_uploader :logo, LogoUploader

  # School types
  @@ownership_type = %w(private public)
  @@level_type = %w(primary secondary pre-school all other)
  @@mode_type = %w(day boarding mixed other)
  @@gender_type = %w(male female mixed)

  # School information panels
  @@info_type = %w(about news faculties staff academics contact_us)

  validates :name, presence: true, length: 3..255
  validates :email, length: 5..100, format: EMAIL_REGEX, allow_blank: true
  validates :phone, numericality: {only_integer: true}, allow_nil: true
  validates :ownership, inclusion: {in: @@ownership_type},
            length: {maximum: 50},
            presence: true
  validates :level, inclusion: {in: @@level_type},
            length: {maximum: 50},
            presence: true
  validates :mode, inclusion: {in: @@mode_type},
            length: {maximum: 50},
            presence: true
  validates :gender, inclusion: {in: @@gender_type},
            presence: true,
            length: {maximum:50}
  validates :about, presence: true

  # School type options
  def self.ownership_options
    @@ownership_type.map { |o| [o,o] }.unshift(["any", "" ])
  end

  def self.level_options
    @@level_type.map { |l| [l,l] }.unshift(["any", "" ])
  end

  def self.mode_options
    @@mode_type.map { |m| [m,m] }.unshift(["any", "" ])
  end

  def self.gender_options
    @@gender_type.map { |g| [g,g] }.unshift(["any", "" ])
  end

  # School info options
  def info_options
    # Return only info types with content
    @@info_type.select { |info_attr| self.send("#{info_attr}?") }
  end

  # Conditionally build a search query based on school options
  def self.index_query(params)
    options = {}
    fields = ['ownership','level', 'mode', 'gender']

    # Collect form fields if present
    if params.present?
      fields.each do |field|
        # Skip field if missing or is 'any'
        options[field] = params[field] unless params[field].blank?
      end
    end

    if options.present?
      # Return filtered and paginated schools
      query = where(options).paginate(page: params[:page])
    else
      # Return paginated results of all schools
      query = paginate(page: params[:page])
    end

    # Search for schools by name
    query = query.where("name ILIKE ?", "%#{params[:name]}%") unless params[:name].blank?

    # Only return required fields for faster queries on heavy data sets
    query.select(:id, :name, :about, :logo)
  end

end

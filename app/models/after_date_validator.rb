class AfterDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    other_date = record.public_send(options.fetch(:with))

    return if other_date.blank?

    if value < other_date
      record.errors.add(attribute, (options[:message] || "must be after #{options[:with].to_s.humanize}"))
    end
  end
end

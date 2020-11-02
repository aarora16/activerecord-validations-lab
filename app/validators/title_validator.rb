class TitleValidator < ActiveModel::Validator
  def validate(record)
    clickbait = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    title = record.title
    is_valid = nil

    unless title.nil?
      clickbait.each do |bait|
        if title.include? bait
          is_valid = true
        end
      end
      if is_valid
        true
      else
        record.errors[:title] << "Needs to be clickbaitey"
      end
    end
  end
end
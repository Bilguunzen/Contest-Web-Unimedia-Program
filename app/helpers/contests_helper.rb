module ContestsHelper
  def get_time(contest_date)
    current_date = Time.now
    if (current_date.year > contest_date.year) 
      return "past"
    end
    if (current_date.year < contest_date.year)
      return (contest_date.year.to_i - current_date.year.to_i).to_s + " year left"
    end

    if (current_date.month > contest_date.month) 
      return "past"
    end
    if (current_date.month < contest_date.month)
      return (contest_date.month.to_i - current_date.month.to_i).to_s + " month left"
    end

    if (current_date.day > contest_date.day) 
      return "past"
    end
    if (current_date.day < contest_date.day)
      return (contest_date.day.to_i - current_date.day.to_i).to_s + " day left"
    end
    
    if (current_date.hour > contest_date.hour) 
      return "past"
    end
    if (current_date.hour < contest_date.hour)
      return (contest_date.hour.to_i - current_date.hour.to_i).to_s + " hour left"
    end
    if (current_date.min > contest_date.min) 
      return "past"
    end
    if (current_date.min < contest_date.min)
      return (contest_date.min.to_i - current_date.min.to_i).to_s + " min left"
    end
    if (current_date.sec >= contest_date.sec) 
      return "past"
    end
    if (current_date.min < contest_date.min)
      return (contest_date.min.to_i - current_date.min.to_i).to_s + " min left"
    end
    return "Ending"
  end
end

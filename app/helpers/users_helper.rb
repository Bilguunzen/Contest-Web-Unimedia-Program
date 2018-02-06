module UsersHelper

  def get_rank(cui)
    cuis = Cui.where(contest_id: cui.contest_id).order('point DESC')
    return cuis.index(cui) + 1
  end
end
